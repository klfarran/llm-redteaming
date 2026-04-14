# LLM Redteaming
This mini-project conducts simple prompt injection attacks against the Llama-2-7b-chat model, and employs two basic defense tactics which mitigate the success of these attacks. 

## Overview
The attack pipeline goes through each yaml [InjectLab](https://github.com/ahow2004/injectlab) attack description and feeds the corresponding test case prompt into the model with no other input (if no defense is implemented). A system prompt is set via chat templates which instructs the model "You are a helpful assistant". Each time the model is prompted, do\_sample is set to false, to ensure deterministic and predictable outputs without the impact of variables like temperature. The name of the test case, the prompt, and the model output are added to a results file as each test case is processed by the model. Optionally, a flag can be passed to the script to enable either of the two defenses: -defense 1 strips potentially malicious content from the input before it is processed by the model, and -defense 2 isolates the user input around delimiters and informs the model the user input may contain malicious content. A script run\_attacks.sh is provided which first runs the attacks with no defenses, then runs the attacks with the first defense, and then runs the attacks with the second defense, for ease of testing. In order to run the model with run\_attacks.sh, the environment variable HF\_TOKEN must be set with a HuggingFace user access token. 

## Quick Start (run each defense in sequence)
- export HF_TOKEN= _your-huggingface-token_
- chmod +x ./run_attacks.sh
- ./run_attacks.sh

## Run attacks with a paritcular defense
- python attack_pipeline.py -defense [1 | 2]

## Run attacks with no defense
- python attack_pipeline.py 
