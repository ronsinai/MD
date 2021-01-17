echo 'run MongoDB'
#docker run --init -d --hostname `hostname` -p 27017:27017 --name mongo mongo:4
docker run --init -d --hostname `hostname` -p 27017:27017 -v /data/db:/data/db --name mongo mongo:4

echo 'run RabbitMQ'
#docker run --init -d --hostname `hostname` -p 5672:5672 -p 15672:15672 --name rabbit rabbitmq:3-management-delayed-timestamp
docker run --init -d --hostname `hostname` -p 5672:5672 -p 15672:15672 -v /data/mq:/var/lib/rabbitmq/mnesia --name rabbit rabbitmq:3-management-delayed-timestamp

echo 'run Redis'
#docker run --init -d --hostname `hostname` -p 6379:6379 --name redis redis:6
docker run --init -d --hostname `hostname` -p 6379:6379 -v /data/redis:/data --name redis redis:6

echo 'run God'
docker run --init -d --hostname `hostname` -e AMQP_URI=amqp://10.0.2.15:5672 -e NODE_ENV=production --name god god

# ==========================================================================================================================================================================

echo 'run 1000'
docker run --init -d --hostname `hostname` -p 1995:1995 -e MONGODB_URI=mongodb://10.0.2.15:27017 -e NODE_ENV=production --name 1000 1000

echo 'run Cerebro'
docker run --init -d --hostname `hostname` -p 2004:2004 -e AMQP_URI=amqp://10.0.2.15:5672 -e NODE_ENV=production --name cerebro cerebro

echo 'run Cortex-Node'
docker run --init -d --hostname `hostname` -e AMQP_URI=amqp://10.0.2.15:5672 -e NODE_ENV=production --name cortex-node cortex/node

echo 'run Cortex-C'
docker run --init -d --hostname `hostname` -e AMQP_URI=amqp://10.0.2.15:5672 -e NODE_ENV=production --name cortex-c cortex/c

echo 'run Cortex-Python'
docker run --init -d --hostname `hostname` -e AMQP_URI=amqp://10.0.2.15:5672 -e PYTHON_ENV=production --name cortex-python cortex/python

echo 'run Cortex-MATLAB'
docker run --init -d --hostname `hostname` -e AMQP_URI=amqp://10.0.2.15:5672 -e PYTHON_ENV=production --name cortex-matlab cortex/matlab

echo 'run Professor-Imagings'
docker run --init -d --hostname `hostname` -e AMQP_URI=amqp://10.0.2.15:5672 -e REDIS_URI=redis://10.0.2.15:6379 -e NODE_ENV=production --name professor-imagings professor/imagings

echo 'run Professor-Diagnoses'
docker run --init -d --hostname `hostname` -e AMQP_URI=amqp://10.0.2.15:5672 -e REDIS_URI=redis://10.0.2.15:6379 -e NODE_ENV=production --name professor-diagnoses professor/diagnoses

echo 'run Professor-Diagnoses-Error'
docker run --init -d --hostname `hostname` -e AMQP_URI=amqp://10.0.2.15:5672 -e REDIS_URI=redis://10.0.2.15:6379 -e NODE_ENV=production --name professor-diagnoses-error professor/diagnoses-error

echo 'run Professor-Discharges'
docker run --init -d --hostname `hostname` -e AMQP_URI=amqp://10.0.2.15:5672 -e REDIS_URI=redis://10.0.2.15:6379 -e NODE_ENV=production --name professor-discharges professor/discharges

echo 'run Magneto-Imagings'
docker run --init -d --hostname `hostname` -e AMQP_URI=amqp://10.0.2.15:5672 -e ELEF_URI=http://10.0.2.15:1995 -e NODE_ENV=production --name magneto-imagings magneto/imagings

echo 'run Magneto-Diagnoses'
docker run --init -d --hostname `hostname` -e AMQP_URI=amqp://10.0.2.15:5672 -e ELEF_URI=http://10.0.2.15:1995 -e NODE_ENV=production --name magneto-diagnoses magneto/diagnoses

echo 'run Magneto-Diagnoses-Error'
docker run --init -d --hostname `hostname` -e AMQP_URI=amqp://10.0.2.15:5672 -e ELEF_URI=http://10.0.2.15:1995 -e NODE_ENV=production --name magneto-diagnoses-error magneto/diagnoses-error

echo 'run Magneto-Discharges'
docker run --init -d --hostname `hostname` -e AMQP_URI=amqp://10.0.2.15:5672 -e ELEF_URI=http://10.0.2.15:1995 -e NODE_ENV=production --name magneto-discharges magneto/discharges
