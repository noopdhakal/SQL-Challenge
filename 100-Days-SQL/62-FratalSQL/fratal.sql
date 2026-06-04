-- Create the 'king' table
CREATE TABLE king (
    k_no INT PRIMARY KEY,
    king VARCHAR(50),
    house VARCHAR(50)
);

-- Create the 'battle' table
CREATE TABLE battle (
    battle_number INT PRIMARY KEY,
    name VARCHAR(100),
    attacker_king INT,
    defender_king INT,
    attacker_outcome INT,
    region VARCHAR(50),
    FOREIGN KEY (attacker_king) REFERENCES king(k_no),
    FOREIGN KEY (defender_king) REFERENCES king(k_no)
);

delete from king;
INSERT INTO king (k_no, king, house) VALUES
(1, 'Robb Stark', 'House Stark'),
(2, 'Joffrey Baratheon', 'House Lannister'),
(3, 'Stannis Baratheon', 'House Baratheon'),
(4, 'Balon Greyjoy', 'House Greyjoy'),
(5, 'Mace Tyrell', 'House Tyrell'),
(6, 'Doran Martell', 'House Martell');

delete from battle;
-- Insert data into the 'battle' table
INSERT INTO battle (battle_number, name, attacker_king, defender_king, attacker_outcome, region) VALUES
(1, 'Battle of Oxcross', 1, 2, 1, 'The North'),
(2, 'Battle of Blackwater', 3, 4, 0, 'The North'),
(3, 'Battle of the Fords', 1, 5, 1, 'The Reach'),
(4, 'Battle of the Green Fork', 2, 6, 0, 'The Reach'),
(5, 'Battle of the Ruby Ford', 1, 3, 1, 'The Riverlands'),
(6, 'Battle of the Golden Tooth', 2, 1, 0, 'The North'),
(7, 'Battle of Riverrun', 3, 4, 1, 'The Riverlands'),
(8, 'Battle of Riverrun', 1, 3, 0, 'The Riverlands');
--for each region find house which has won maximum no of battles. display region, house and no of wins
select * from battle;
select * from king;

commit;

/* output house, regioin, no_of_wins */

-- Solution 1

with wins as(
select attacker_king as king, region FROM BATTLE where attacker_outcome = 1 -- win win 
union all
select defender_king, region FROM BATTLE where attacker_outcome = 0) -- win win to keep all wins including duplicates
-- select w.region, k.house as no_of_wins from wins w inner join king k on w.king=k.k_no
select * from (
select w.region, k.house, count(*) as no_of_wins, --- count --> how many victories in each house in each region
rank() over (partition by region order by count(*) desc) as rn --> count(*) higher wins come first
 from wins w inner join king k on w.king=k.k_no
group by w.region, k.house ) where rn = 1
-- order by w.region, k.house
;

-- method 2

select * from (
select b.region, k.house, count(*) as no_of_wins, 
rank() over (partition by b.region order by count(*) desc ) as rn 
 from BATTLE b  
inner join king k
 on k.k_no = case when b.attacker_outcome = 1 then b.attacker_king else b.DEFENDER_KING end
group by b.region, k.house) where rn = 1;
