# echidna-string-manipulation
## run
```
docker pull trailofbits/eth-security-toolbox
docker run -it -v "$PWD":/home/training trailofbits/eth-security-toolbox
solc-select 0.8.0
cd /home/training
echidna-test . --config contracts/config.yaml
```
