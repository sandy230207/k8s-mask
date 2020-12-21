server-update:
	kubectl delete replicationcontroller/mask-server && \
	kubectl delete service/mask-server && \
	kubectl create -f mask-server-service-lb.yaml && \
	kubectl create -f mask-server-rc.yaml

db-create:
	kubectl create -f mask-db-deployment.yaml

db-login:
	kubectl exec mysql-6755785976-48k72 -it -- mysql -u root -p
	UPDATE MASK.STORE SET name="NCCU Pharmacy" WHERE id=5;

	# 10.96.0.0~10.104.255.255