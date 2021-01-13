server-update:
	kubectl delete replicationcontroller/mask-server && \
	kubectl delete service/mask-server && \
	kubectl create -f mask-server-service-lb.yaml && \
	kubectl create -f mask-server-rc.yaml

db-create:
	kubectl create -f mask-db-deployment.yaml

db-login:
	kubectl exec mysql-6755785976-48k72 -it -- mysql -u root -p

scp:
	scp -i "~/nccu/k8s/k8s.pem" ./mask-db.zip ec2-user@ec2-54-162-85-145.compute-1.amazonaws.com:mask-db.zip && \
		scp -i "~/nccu/k8s/k8s.pem" ./mask-server.zip ec2-user@ec2-54-162-85-145.compute-1.amazonaws.com:mask-server.zip

zip:
	zip -r mask-db.zip mask-db/ && \
		zip -r mask-server.zip mask-server/

ssh:
	ssh -i "~/nccu/k8s/k8s.pem" ec2-user@ec2-3-93-64-44.compute-1.amazonaws.com

expose:
	kubectl expose deploy chart-1610361324-mask-server \
		--name mask-server-clusterip \
		--type=ClusterIP