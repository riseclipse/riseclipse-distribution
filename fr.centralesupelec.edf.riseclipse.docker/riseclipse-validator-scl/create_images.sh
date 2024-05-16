#!/bin/sh -x
if [ "$#" -ne 1 ]; then
  echo "The docker tag (full version string, ex: 1.1.0-a24) must be given as argument"
  exit 1
fi
cp /Users/marcadet/git/RiseClipse/GitHub/riseclipse-validator-scl2003/fr.centralesupelec.edf.riseclipse.iec61850.scl.validator/target/RiseClipseValidatorSCL-*-SNAPSHOT.jar RiseClipseValidatorSCL-$1.jar
docker build --tag riseclipse/riseclipse-validator-scl:$1 .
docker push riseclipse/riseclipse-validator-scl:$1
docker rmi riseclipse/riseclipse-validator-scl:$1
docker build --tag riseclipse/riseclipse-validator-scl:latest .
docker push riseclipse/riseclipse-validator-scl:latest
docker rmi riseclipse/riseclipse-validator-scl:latest
rm RiseClipseValidatorSCL-$1.jar
