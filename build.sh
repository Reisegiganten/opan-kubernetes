#!/usr/bin/env bash
NEXT="$(kubectl get -o json deployment/opan| perl -Mojo -e'local $/;my ($c,$i)=split(":", j(<STDIN>)->{spec}{template}{spec}{containers}[0]{image}); print join(":",$c, ++$i)' -)"
echo $NEXT
docker build . -t $NEXT
gcloud docker -- push $NEXT
kubectl set image deployment/opan opan=$NEXT
