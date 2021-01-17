echo '--- Preparations ---'

echo 'run MongoDB'
docker run --init -d --hostname `hostname` -p 27017:27017 -v /data/db:/data/db --name mongo mongo:4
echo 'run RabbitMQ'
docker run --init -d --hostname `hostname` -p 5672:5672 -p 15672:15672 -v /data/mq:/var/lib/rabbitmq/mnesia --name rabbit rabbitmq:3-management-delayed-timestamp
echo 'run Redis'
docker run --init -d --hostname `hostname` -p 6379:6379 -v /data/redis:/data --name redis redis:6


echo '--- Tests ---'

echo 'Test God'
cd ~/Workspace/God && npm i && npm test

echo 'Test 1000'
cd ~/Workspace/1000 && npm i && npm test

echo 'Test Cerebro'
cd ~/Workspace/Cerebro && npm i && npm test

echo 'Test Magneto-Imagings'
cd ~/Workspace/Magneto && git co imagings && npm i && npm test
echo 'Test Magneto-Diagnoses'
cd ~/Workspace/Magneto && git co diagnoses && npm i && npm test
echo 'Test Magneto-Diagnoses-Error'
cd ~/Workspace/Magneto && git co diagnoses-error && npm i && npm test
echo 'Test Magneto-Discharges'
cd ~/Workspace/Magneto && git co discharges && npm i && npm test

echo 'Test Professor-Imagings'
cd ~/Workspace/Professor && git co imagings && npm i && npm test
echo 'Test Professor-Diagnoses'
cd ~/Workspace/Professor && git co diagnoses && npm i && npm test
echo 'Test Professor-Diagnoses-Error'
cd ~/Workspace/Professor && git co diagnoses-error && npm i && npm test
echo 'Test Professor-Discharges'
cd ~/Workspace/Professor && git co discharges && npm i && npm test

echo 'Test Cortex-Node'
cd ~/Workspace/Cortex && git co node && npm i && npm test
echo 'Test Cortex-C'
cd ~/Workspace/Cortex && git co c && npm i && npm test
echo 'Test Cortex-Python'
cd ~/Workspace/Cortex && git co python && pip install -r requirements-test.txt && python -m pytest -v
echo 'Test Cortex-MATLAB'
cd ~/Workspace/Cortex && git co matlab && pip install -r requirements-test.txt && python -m pytest -v
