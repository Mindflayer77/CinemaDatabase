class Film:
    titleId = ""
    title = ""
    region = ""
    language = ""
    year = ""
    age = 12
    duration = 0
    short_description = "No description available"
    long_description = ""

    def __init__(
        self,
        id="",
        imdb_id="",
        title="",
        region="",
        language="",
        year=None,
        age=12,
        duration=0,
        short_description="No description available",
        long_description="",
        genres=None,
    ):
        if genres is None:
            genres = []
        self.id = id
        self.imdb_id = imdb_id
        self.title = title
        self.region = region
        self.language = language
        self.year = year
        self.age = age
        self.duration = duration
        self.short_description = short_description
        self.long_description = long_description
        self.genres = genres
