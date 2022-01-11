kubectl apply -f airflow-envvars-configmap.yml
kubectl apply -f requirements-configmap.yml
kubectl apply -f airflow-logs-pvc.yml
kubectl apply -f airflow-postgres.yml
kubectl apply -f airflow-webserver.yml
kubectl apply -f airflow-scheduler.yml