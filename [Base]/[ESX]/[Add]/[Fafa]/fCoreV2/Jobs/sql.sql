CREATE TABLE `billing_entreprise` (
  `id` int(11) NOT NULL,
  `employe` varchar(50) NOT NULL,
  `client` varchar(50) NOT NULL,
  `facture` int(11) NOT NULL,
  `raison` longtext NOT NULL,
  `job` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `billing_entreprise` (
  `id` int(11) NOT NULL,
  `employe` varchar(50) NOT NULL,
  `client` varchar(50) NOT NULL,
  `facture` int(11) NOT NULL,
  `raison` longtext NOT NULL,
  `job` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `billing_entreprise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

ALTER TABLE `job_grades` ADD `vestiaire` TINYINT(1) NOT NULL DEFAULT '0' AFTER `salary`;
ALTER TABLE `job_grades` ADD `ventevehi` TINYINT(1) NOT NULL DEFAULT '0' AFTER `vestiaire`;

