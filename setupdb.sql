CREATE TABLE phase(
   id INT PRIMARY KEY     NOT NULL,
   titre          VARCHAR(25)    NOT NULL,
   definition     VARCHAR(50)     NOT NULL,
   questions        TEXT NOT NULL,
   phase_suivante_id         INT,
   est_courante   BOOLEAN,
   CONSTRAINT fk_phase_suivante
      FOREIGN KEY(phase_suivante_id) 
      REFERENCES phase(id)
);

CREATE TYPE carte_type AS ENUM ('remarque', 'valeur', 'pratique', 'theorie');

CREATE TABLE carte(
   id          SERIAL PRIMARY KEY,
   type_carte          carte_type    NOT NULL,
   texte     TEXT     NOT NULL,
   est_pioche        BOOLEAN NOT NULL,
   est_courante   BOOLEAN
);


INSERT INTO phase VALUES
  (
    0,
	'Phase d''intéressement',
    'Phase primordiale pour mobiliser l''élève',
    '<ol><li>Quel est l''objectif de ma leçon ?</li><li>Comment partir de ce qu''il connait ? </li><li>Comment les motiver à apprendre</li></ol>',
    1,
    TRUE
  ),
  (
  1,
  'Phase de formation',
  'Phase d’apports de la théorie, de la manière de procéder',
  '<ol><li>Comment les rendre actifs ?</li><li>Comment vérifier le suivi de tous ?</li><li>Quels éléments apporter ?</li><li>Dans quel ordre présenter les éléments et comment faire le lien entre eux ?</li></ol>',
  2,
  FALSE
  ) ,
  (
  2,
  'Phase d''intégration',
  'Phase d''application de la part des élèves',
  '<ol><li>Quels moyens, ayant du sens, mettre en place ?</li><li>Comment avoir un suivi individualisé ?</li><li>Quels modamités mettre en place ?</li></ol>',
  3,
  FALSE
  ) ,
  (
  3,
  'Phase de régulation',
  'Phase permettant de relever les erreurs et de les comprendre',
  '<ol><li>Comment relever et classer les erreurs ?</li><li>Comment les éviter, quels moyens utiliser pour les contrer ?</li><li>Comment expliquer autrement ce qui n''est pas acquis ?</li></ol>',
  4,
  FALSE
  ) ,
  (
  4,
  'Phase d''évaluation',
  'Phase de vérification des acquis',
  '<ol><li>Comment donner du sens à l''évaluation ?</li><li>Comment permettre une auto-évaluation ?</li><li>Quelles modalités mettre en place ?</li><li>Est-il possible de faire des évaluations différenciées selon les besoins des élèves ?</li></ol>',
  5,
  FALSE
  ) ,

  
  ;

  INSERT INTO carte (type_carte, texte, est_pioche, est_courante)
  VALUES
   (
    'valeur',
    '<a href="">La pédagogie active ou traditionelle</a>',
    false,
    false
   )
  ;
