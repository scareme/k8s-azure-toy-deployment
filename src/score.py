def init():
    with open("resources/corpora/stopwords/english", "r", encoding="utf-8") as file:
        stopwords = (line for line in file)
        print(*stopwords)


def run(input_request):
    print({"input_request": input_request})
    return input_request


if __name__ == "__main__":
    init()
