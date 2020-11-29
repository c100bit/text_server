# TextServer

**Сервер проверки схожести рацпредложений**
В основе лежит [Коэффициент Жаккара](https://ru.wikipedia.org/wiki/%D0%9A%D0%BE%D1%8D%D1%84%D1%84%D0%B8%D1%86%D0%B8%D0%B5%D0%BD%D1%82_%D0%96%D0%B0%D0%BA%D0%BA%D0%B0%D1%80%D0%B0)
Запущен на [Heroku](https://rocky-depths-37442.herokuapp.com/check_theme)

Клиенты асинхронно передают запрос на проверку схожести при заполнении предложения

Стек: elixir, postgresql

Два колбека для проверки предложения и синхронизации текстов:

```
curl -i -X POST "https://rocky-depths-37442.herokuapp.com/check_theme" -H "Content-Type: application/json" -d '{"title": "title", "text": "text"}'

curl -i -X POST "https://rocky-depths-37442.herokuapp.com/load_themes" -H "Content-Type: application/json" -d '{"themes": [{"id": 1, "title": "title1", "text": "text1"}, {"id": 2, "title": "title2", "text": "text2"} ]}'
```

Колбек проверки схожести /check_theme возвращает массив id предложений схожих по тексту:

```
{"result":{"proposal_ids":[1,2]},"status":"ok"}
```
