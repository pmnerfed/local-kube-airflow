kubectl delete -f airflow-envvars-configmap.yml
kubectl delete -f airflow-logs-pvc.yml
kubectl delete -f airflow-postgres.yml
kubectl delete -f airflow-scheduler.yml
kubectl delete -f airflow-webserver.yml
kubectl delete -f requirements-configmap.yml