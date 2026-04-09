#!/bin/bash

# Usage: ./make_json.sh <seq1> <seq2> <job_name>

SEQ1=$1
SEQ2=$2
NAME=${3:-af3_interaction_job}

python3 -c "
import json
data = {
    'name': '$NAME',
    'modelSeeds': [1],
    'sequences': [
        {'protein': {'id': ['A'], 'sequence': '$SEQ1'}},
        {'protein': {'id': ['B'], 'sequence': '$SEQ2'}}
    ],
    'dialect': 'alphafold3',
    'version': 1
}
print(json.dumps(data, indent=2))
" > input.json

echo "Generated input.json for job: $NAME"
