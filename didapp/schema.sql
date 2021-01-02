DROP TABLE IF EXISTS phase;
DROP TABLE IF EXISTS carte;
DROP TYPE IF EXISTS carte_type;

CREATE TABLE phase(
   id INT PRIMARY KEY     NOT NULL,
   titre          TEXT    NOT NULL,
   definition     TEXT     NOT NULL,
   questions        TEXT NOT NULL,
   phase_suivante_id         INT,
   est_courante   BOOLEAN,
   CONSTRAINT fk_phase_suivante
      FOREIGN KEY(phase_suivante_id) 
      REFERENCES phase(id)
);
CREATE TYPE carte_type AS ENUM ('Remarque-élève', 'Valeur', 'Pratique', 'Théorie');

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
  '<ol><li>Quels moyens, ayant du sens, mettre en place ?</li><li>Comment avoir un suivi individualisé ?</li><li>Quels modalités mettre en place ?</li></ol>',
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
  NULL,
  FALSE
  )
  ;

  INSERT INTO carte (type_carte, texte, est_pioche, est_courante)
  VALUES
   (
    'Valeur',
    '<a href="https://drive.google.com/file/d/1yZswCOQ2JjN_-RLOSe__aVReInhf8o_Z/view?usp=sharing">La pédagogie active ou traditionelle</a>',
    FALSE,
    FALSE
   ) ,
   (
    'Valeur',
    '<a href="https://drive.google.com/file/d/1d27VnzM357bcV2gxb7a-aT0AgNCZiGF4/view?usp=sharing">Les valeurs de l''enseignement</a>',
    FALSE,
    FALSE
   ) ,
   (
    'Valeur',
    '<a href="https://drive.google.com/file/d/11Ow_uApVg01sXRE2LecnH8azNelNKXbe/view?usp=sharing">Le plaisir</a>',
    FALSE,
    FALSE
   ) ,
   (
    'Valeur',
    '<a href="https://drive.google.com/file/d/1cSCmAeZwpe3EHgbDrQ1oqY9cmT_D4qDs/view?usp=sharing">La créativité</a>',
    FALSE,
    FALSE
   ) ,
   (
    'Valeur',
    '<a href="https://drive.google.com/file/d/1Kku_Zku9CbdYgZNiv8jiVTYMa2uNoxQd/view?usp=sharing">L''entraide</a>',
    FALSE,
    FALSE
   ) ,
   (
    'Théorie',
    '<a href="https://drive.google.com/file/d/1XuycCRRj0k1iRwmVJaYPtb_4im3r5sDz/view?usp=sharing">Le socle des compétences</a>',
    FALSE,
    FALSE
   ) ,
   (
    'Théorie',
    '<a href="https://drive.google.com/file/d/1oicfLNFMFsPmZsqCu7iUZ7pv0cgJ26lg/view?usp=sharing">Les référentiels</a>',
    FALSE,
    FALSE
   ) ,
   (
    'Théorie',
    '<a href="https://drive.google.com/file/d/1fdqlGDUYv7g1h3H6e3P9Eeue_1KhM7Cc/view?usp=sharing">La structure des apprentissages</a>',
    FALSE,
    FALSE
   ) ,
   (
    'Théorie',
    '<a href="https://drive.google.com/file/d/1RKQCCQcTQV9J_8EVDGFV1i8m3qtbO6dp/view?usp=sharing">Les manuels scolaires</a>',
    FALSE,
    FALSE
   ) ,
   (
    'Théorie',
    '<a href="https://drive.google.com/file/d/18II0kqu2TlqT2NP0uPtNeIQm9rSJbD2R/view?usp=sharing">Les sites internet</a>',
    FALSE,
    FALSE
   ) ,
   (
    'Pratique',
    '<a href="https://drive.google.com/file/d/124ebvI_wE1B4H76lhBdVXo7aeYCalAPE/view?usp=sharing">Les différentes méthodes</a>',
    FALSE,
    FALSE
   ) ,
   (
    'Pratique',
    '<a href="https://drive.google.com/file/d/1PoO4CQeHp5GN4qMXHKR7D5eiJxD8xsyW/view?usp=sharing">Les devoirs</a>',
    FALSE,
    FALSE
   ) ,
   (
    'Pratique',
    '<a href="https://drive.google.com/file/d/1k5CyO3SaZU41L5WYr-yvTzkGIcVpi82y/view?usp=sharing">La motivation</a>',
    FALSE,
    FALSE
   ) ,
   (
    'Pratique',
    '<a href="https://drive.google.com/file/d/1B2Pt3rOTB1deaquszwQ8KjvrYAVXoLtC/view?usp=sharing">L''erreur</a>',
    FALSE,
    FALSE
   ) ,
   (
    'Pratique',
    '<a href="https://drive.google.com/file/d/19IhyvM9U2BivHB60Sr2WMdt7OnZH67PE/view?usp=sharing">Le jeu</a>',
    FALSE,
    FALSE
   ) ,
   (
   'Remarque-élève',
   '"On devra finir à la maison ?" ',
   FALSE, 
   FALSE
   ) ,
   (
   'Remarque-élève',
   '"Je peux utiliser mon dictionnaire ?" ',
   FALSE, 
   FALSE
   ) ,
   (
   'Remarque-élève',
   '"J''ai fini." ',
   FALSE, 
   FALSE
   ) ,
   (
   'Remarque-élève',
   '"Il reste combien de temps ?" ',
   FALSE, 
   FALSE
   ) ,
   (
   'Remarque-élève',
   '"Je n''y arrive pas." ',
   FALSE, 
   FALSE
   ) ,
   (
   'Remarque-élève',
   '"On corrige ensemble ?" ',
   FALSE, 
   FALSE
   ) ,
   (
   'Remarque-élève',
   '"Je m''ennuie." ',
   FALSE, 
   FALSE
   ) ,
   (
   'Remarque-élève',
   '"Je ne comprends pas pourquoi on fait ça." ',
   FALSE, 
   FALSE
   ) ,
   (
   'Remarque-élève',
   '"Pourquoi fait-on cela ?" ',
   FALSE, 
   FALSE
   ) ,(
   'Remarque-élève',
   '"Je peux le faire avec mon ami ?" ',
   FALSE, 
   FALSE
   )
  ;
