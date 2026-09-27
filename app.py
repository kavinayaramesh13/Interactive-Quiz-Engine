from flask import Flask, render_template, request
import json

app = Flask(__name__)


def load_questions():
    with open("questions.json", "r") as file:
        return json.load(file)


@app.route("/")
def home():
    questions = load_questions()
    return render_template("index.html", questions=questions)


@app.route("/submit", methods=["POST"])
def submit_quiz():

    questions = load_questions()

    score = 0
    total = len(questions)

    for index, question in enumerate(questions):

        selected_answer = request.form.get(f"question_{index}")

        if selected_answer is not None:
            selected_answer = int(selected_answer)

            if selected_answer == question["answer"]:
                score += 1

    percentage = (score / total) * 100 if total > 0 else 0

    return render_template(
        "result.html",
        score=score,
        total=total,
        percentage=percentage
    )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)