# Airflow

Airflow is a workflow engine that will easily schedule and run your complex data pipelines. It will make sure that each task of your data pipeline will get executed in the correct order and each task gets the required resources.

WE will install Airflow on kubernetes cluster with the configuration files in this repo and use kubernetes itself to run the tasks.

Airflow has 3 components that are required:

1. Webserver : The UI where we can interact with and schedule tasks and pipelines.
2. Schedueler: The component that decides what task will run when.
3. Workers   : The component that executes or runs the tasks. 

Airflow provdes many types of executors that allow us to do all kinds of things. We can call APIs, monitor health of APIs, run bash scripts, run custom pythion scripts.

## Components of Airflow Pipeline/task

The pipeline is almost always defined as a DAG(directed acyclic graph). in a DAG you set up dependencies of tasks on each other and airflow will then read the dependencies and execute them in order.