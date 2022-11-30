CREATE TABLE `player_jobs` (
    `cid` varchar(100) NOT NULL,
    `job` varchar(100) NOT NULL,
    `grade` int(11) NOT NULL
);
CREATE TABLE `player_jobs_num` (
  `cid` varchar(100) NOT NULL,
  `jobs` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
