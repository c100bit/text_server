# TextServer

**Сервер проверки схожести рацпредложений**
В основе лежит [Коэффициент Жаккара](https://ru.wikipedia.org/wiki/%D0%9A%D0%BE%D1%8D%D1%84%D1%84%D0%B8%D1%86%D0%B8%D0%B5%D0%BD%D1%82_%D0%96%D0%B0%D0%BA%D0%BA%D0%B0%D1%80%D0%B0)
Запущен на [Heroku](https://rocky-depths-37442.herokuapp.com/check_theme)

Клиенты асинхронно передают запрос на проверку схожести при заполнении предложения

Два колбека для проверки предложения и синхронизации текстов:
```
curl -i -X POST "https://rocky-depths-37442.herokuapp.com/check_theme" -H "Content-Type: application/json" -d '{"title": "title", "text": "text"}'

curl -i -X POST "https://rocky-depths-37442.herokuapp.com/load_themes" -H "Content-Type: application/json" -d '{"themes": [{"title": "title1", "text": "text1"}, {"title": "title2", "text": "text2"} ]}'
```

Возвращает коэффициент схожести - {"result":0.6,"status":"ok"}
