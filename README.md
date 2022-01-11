# Airflow

Airflow is a workflow engine that will easily schedule and run your complex data pipelines. It will make sure that each task of your data pipeline will get executed in the correct order and each task gets the required resources.

WE will install Airflow on kubernetes cluster with the configuration files in this repo and use kubernetes itself to run the tasks.

Airflow has 3 components that are required:

1. Webserver : The UI where we can interact with and schedule tasks and pipelines.
2. Schedueler: The component that decides what task will run when.
3. Workers   : The component that executes or runs the tasks. 

Airflow provdes many types of executors that allow us to do all kinds of things. We can call APIs, monitor health of APIs, run bash scripts, run custom pythion scripts.

We will utilize the kubernetes clusters to autoschedule workers via airflow using the `KubernetesExecutor`

## Components of Airflow Pipeline/task

The pipeline is almost always defined as a DAG(directed acyclic graph). in a DAG you set up dependencies of tasks on each other and airflow will then read the dependencies and execute them in order.

## Setting up airflow in local kubernetes

We will use the [puckel/docker-airflow](https://hub.docker.com/r/puckel/docker-airflow) docker image which comes with some of the important dependencies already installed and also allows for some amount of customizations.

- We control the configurations through environment variables and all of them are maintained seperately in a `configMap`. look at the [envvars configmap yaml file](airflow-envvars-configmap.yml).
- We install extra requirements by mounting the requirement.txt file from kubernetes' `configMap` required for interacting with `KubernetesExecutor`.

- We also need to mount a directory where we will place all our `DAG` files.
- We also create a seperate persistent volume to store logs just because we want to keep them for later.
- Now, for airflow to be able to interact with kubernetes, we need to give special access to airflow for creating and managing worker pods. So we need to create a `ClusterRole`  attached to a `ServiceAccount` with needed permissions. This is handled in [airflow-webserver.yml](airflow-webserver.yml).

## Resources

- <https://ipeluffo.github.io/apache_airflow_kubernetes/>