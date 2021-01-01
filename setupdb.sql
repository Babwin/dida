CREATE TABLE phase(
   id INT PRIMARY KEY     NOT NULL,
   titre          VARCHAR(25)    NOT NULL,
   definition     VARCHAR(25)     NOT NULL,
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
   est_courante   BOOLEAN,
);


INSERT INTO phase VALUES
  (
    0, 'Phase d''intéressement',
    'Cette phase est primordiale pour mobiliser l''élève',
    '<ol><li>Quel est l''objectif de ma leçon ?</li><li>Comment partir de ce qu''il connait ? </li><li>Comment les motiver à apprendre</li>',
    ,
    TRUE
  ),
  ;

  INSERT INTO carte VALUES
   (
    'valeur',
    '<a href="">La pédagogie active ou traditionelle</a>',
    false,
    false
   ),
  ;
