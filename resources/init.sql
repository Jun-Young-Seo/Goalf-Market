CREATE TABLE IF NOT EXISTS ball(
    ball_id VARCHAR(20) NOT NULL,
    ball_price INTEGER,
    ball_name VARCHAR(20),
    ball_brand VARCHAR(20),
    ball_description TEXT,
    ball_stock LONG,
    ball_category VARCHAR(10),
    ball_releaseDate VARCHAR(20),
    ball_isLosted boolean,
    ball_fileName VARCHAR(30),
    primary KEY (ball_id)
    )default CHARSET=utf8;

CREATE TABLE IF NOT EXISTS club(
    club_id VARCHAR(20) NOT NULL,
    club_price INTEGER,
    club_name VARCHAR(20),
    club_brand VARCHAR(20),
    club_description TEXT,
    club_stock LONG,
    club_category VARCHAR(10),
    club_releaseDate VARCHAR(20),
    club_isUsed boolean,
    club_fileName VARCHAR(30),
    primary key (club_id)
    )default CHARSET=utf8;

insert into ball values(
                           "B_000001",
                           50000,
                           "titleast",
                           "타이틀리스트",
                           "타이틀리스트 볼, 최고의 반발력",
                           50,
                           "whiteBall",
                           "20-05-05",
                           false,
                           "titleast.jpg"
                       );

insert into ball values(
                           "B_000002",
                           7000,
                           "Volvik color ball",
                           "볼빅",
                           "볼빅 컬러 볼",
                           30,
                           "ColorBall",
                           "22-01-15",
                           true,
                           "volvik.jpg"
                       );

insert into ball values(
                           "B_000003",
                           3000,
                           "CostCo ball",
                           "kirkland",
                           "코스트코 번들 볼",
                           1000,
                           "whiteBall",
                           "24-03-01",
                           false,
                           "kirkland.jpg"
                       );

insert into club values(
                           "C_000001",
                           500000,
                           "스텔스 1",
                           "Taylormade",
                           "최고의 선택. 스텔스 드라이버",
                           1,
                           "Driver",
                           "20-05-05",
                           true,
                           "stealth.jpg"
                       );

insert into club values(
                           "C_000002",
                           700000,
                           "Ping 430 Max",
                           "PING",
                           "최신형 드라이버 핑",
                           3,
                           "Driver",
                           "23-01-30",
                           false,
                           "430.jpg"
                       );

insert into club values(
                           "C_000003",
                           300000,
                           "Mizuno iron",
                           "Mizuno",
                           "국민 아이언 미즈노",
                           5,
                           "Iron",
                           "22-11-01",
                           false,
                           "mizuno.jpg"
                       );
CREATE TABLE IF NOT EXISTS USER(
                                   id VARCHAR(20),
                                   pwd VARCHAR(30),
                                   type VARCHAR(10),
                                   name VARCHAR(20),
                                   tel VARCHAR(30),
                                   nation VARCHAR(30),
                                   primary key (id)
)default charset=utf8;

