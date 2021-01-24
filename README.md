Docker image wird wie folgt installiert: sudo docker build -t memyself:crewlink -f Dockerfile .

Docker Container wird danach mit sudo docker run -d -p [PORT]:9736 -e ADDRESS=localhost --name [CONTAINER_NAME] memyself:crewlink erstellt.

Gestartet kann dieser Container mit sudo docker start [CONTAINER_NAME]