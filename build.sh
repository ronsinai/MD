cd ~/Workspace/God && docker build --no-cache -t god .

cd ~/Workspace/1000 && docker build --no-cache -t 1000 .

cd ~/Workspace/Cerebro && docker build --no-cache -t cerebro .

cd ~/Workspace/Cortex && git co node && docker build --no-cache -t cortex/node .
cd ~/Workspace/Cortex && git co c && docker build --no-cache -t cortex/c .
cd ~/Workspace/Cortex && git co python && docker build --no-cache -t cortex/python .
cd ~/Workspace/Cortex && git co matlab && docker build --no-cache -t cortex/matlab .

cd ~/Workspace/Professor && git co imagings && docker build --no-cache -t professor/imagings .
cd ~/Workspace/Professor && git co diagnoses && docker build --no-cache -t professor/diagnoses .
cd ~/Workspace/Professor && git co diagnoses-error && docker build --no-cache -t professor/diagnoses-error .
cd ~/Workspace/Professor && git co discharges && docker build --no-cache -t professor/discharges .

cd ~/Workspace/Magneto && git co imagings && docker build --no-cache -t magneto/imagings .
cd ~/Workspace/Magneto && git co diagnoses && docker build --no-cache -t magneto/diagnoses .
cd ~/Workspace/Magneto && git co diagnoses-error && docker build --no-cache -t magneto/diagnoses-error .
cd ~/Workspace/Magneto && git co discharges && docker build --no-cache -t magneto/discharges .
