#!/bin/bash
output=$(curl -s "https://quizapi.io/api/v1/questions?apiKey=${API_KEY}&limit=10")


if ! echo "$output" | jq -e '.[0]' > /dev/null 2>&1; then
    echo "API Error:"
    echo "$output" | jq .
    exit 1
fi


output=$(echo $output | jq .[0])

question=$(echo $output | jq .question)

answer_a=$(echo $output | jq .answers.answer_a)
answer_b=$(echo $output | jq .answers.answer_b)
answer_c=$(echo $output | jq .answers.answer_c)
answer_d=$(echo $output | jq .answers.answer_d)


echo "
Question: ${question}

A) ${answer_a}
B) ${answer_b}
C) ${answer_c}
D) ${answer_d}
"