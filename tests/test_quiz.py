import json


def test_questions_file_exists():

    with open("questions.json", "r") as file:
        questions = json.load(file)

    assert len(questions) > 0


def test_question_structure():

    with open("questions.json", "r") as file:
        questions = json.load(file)

    for question in questions:

        assert "question" in question
        assert "options" in question
        assert "answer" in question

        assert len(question["options"]) == 4

        assert 0 <= question["answer"] < 4