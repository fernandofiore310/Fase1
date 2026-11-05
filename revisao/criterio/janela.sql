-- Kings deve ter 22 vitorias no fim

WITH teams_games AS (
    SELECT
    g.id game_id,
    t.id team_id,
    g.date,
    t.full_name,
    g.home_team_score points_scored,
    CASE
        WHEN g.home_team_score > g.visitor_team_score THEN 1
        WHEN g.home_team_score < g.visitor_team_score THEN 0
        ELSE 2
    END AS result
    FROM games g
    JOIN teams t ON g.home_team_id=t.id
    JOIN specific_dates s ON g.season=s.season
    WHERE g.postseason IS FALSE AND g.date <= s.last_reg_season_game_date AND g.id <> s.ist_final_id AND g.season = 2025

    UNION ALL

    SELECT
    g.id game_id,
    t.id team_id,
    g.date,
    t.full_name,
    g.visitor_team_score points_scored,
    CASE
        WHEN g.home_team_score < g.visitor_team_score THEN 1
        WHEN g.home_team_score > g.visitor_team_score THEN 0
        ELSE 2
    END AS result
    FROM games g
    JOIN teams t ON g.visitor_team_id=t.id
    JOIN specific_dates s ON g.season=s.season
    WHERE g.postseason IS FALSE AND g.date <= s.last_reg_season_game_date AND g.id <> s.ist_final_id AND g.season = 2025
    ORDER BY g.date
)
SELECT
date,
full_name,
result,
SUM(result) OVER (
    PARTITION BY team_id
    ORDER BY date
) total_wins,
COUNT(result) OVER (
    PARTITION BY team_id
    ORDER BY date
) games_played
FROM teams_games
;
