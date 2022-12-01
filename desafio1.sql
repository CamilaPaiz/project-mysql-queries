DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plano(
      plano_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      plano_nome VARCHAR(100) NOT NULL ,
      preco DOUBLE NOT NULL 
  ) engine = InnoDB;
  
 INSERT INTO SpotifyClone.plano (plano_nome, preco)
  VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);
  
  CREATE TABLE SpotifyClone.usuario(
      usuario_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      usuario_nome VARCHAR(100) NOT NULL,
      usuario_idade INT NOT NULL,
       FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.usuario (usuario_nome, usuario_idade, plano_id)
  VALUES
  ('Barbara Liskov', 82, 1),
  ('Robert Cecil Martin', 58, 1),
  ('Ada Lovelace', 37, 2),
  ('Martin Fowler', 46, 2),
  ('Barbara Liskov', 82, 2),
  ('Robert Cecil Martin', 58, 3),
  ('Ada Lovelace', 37, 3),
  ('Martin Fowler', 46, 4),
  ('Ada Lovelace', 37, 4),
  ('Martin Fowler', 46, 4);

  CREATE TABLE SpotifyClone.assinatura(
      assinatura_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      data_assinatura DATE,
      usuario_id INT NOT NULL,
      plano_id INT NOT NULL,
	    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
      FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.assinatura (data_assinatura, usuario_id, plano_id)
  VALUES
    ('2019-10-20', 1, 1),
    ('2017-01-06', 2, 1),
    ('2017-12-30', 3, 2),
    ('2017-01-17', 4, 2),
    ('2018-04-29', 5, 2),
    ('2018-02-14', 6, 3),
    ('2018-01-05', 7, 3),
    ('2019-06-05', 8, 4),
    ('2020-05-13', 9, 4),
    ('2017-02-17', 10, 4);
    
  CREATE TABLE SpotifyClone.artista(
      artista_id INT PRIMARY KEY AUTO_INCREMENT,
      artista_nome VARCHAR(100)
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.artista(artista_nome)
  VALUES
  ('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
  ('Nina Simone');
    
    CREATE TABLE SpotifyClone.album(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      album_nome VARCHAR(100),
      artista_id INT,
	    FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.album (album_nome, artista_id)
  VALUES
  ('Renaissance', 1),
	('Jazz', 2),
	('Hot Space', 2),
	('Falso Brilhante', 3),
	('Vento de Maio', 3),
  ('QVVJFA', 4),
  ('Somewhere Far Beyond', 5),
  ('I Put A Spell On You', 6);
    
     CREATE TABLE SpotifyClone.musica(
      musica_id INT PRIMARY KEY AUTO_INCREMENT,
      musica_nome VARCHAR(100),
	    duracao INT NOT NULL,
      album_id INT NOT NULL,
	    FOREIGN KEY (album_id) REFERENCES album(album_id)
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.musica (musica_nome, duracao, album_id)
  VALUES
  ('BREAK MY SOUL', 279, 1),
	('VIRGOS GROOVE', 369, 1),
	('ALIEN SUPERSTAR', 116, 1),
	('Dont Stop Me Now', 203, 2),
	('Under Pressure', 152, 3),
  ('Como Nossos Pais', 105, 4),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
  ('Samba em Paris', 267, 6),
  ('The Bards Song', 244, 7),
  ('Feeling Good', 100, 8);
    
    CREATE TABLE SpotifyClone.seguindo_artista(
      seguindo_id INT PRIMARY KEY AUTO_INCREMENT,
      artista_id INT,
      usuario_id INT NOT NULL,
	    FOREIGN KEY (artista_id) REFERENCES artista(artista_id),
      FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.seguindo_artista (artista_id, usuario_id)
  VALUES
  (1,1),
	(2,1),
	(3,1),
	(1,2),
	(3,2),
  (2,3),
  (4,4),
  (5,5),
  (6,5),
  (6,6),
  (1,6),
  (6,7),
  (3,9),
  (2,10);
    
     CREATE TABLE SpotifyClone.reproducao(
      reproducao_id INT PRIMARY KEY AUTO_INCREMENT,
      data_reproducao DATETIME,
      musica_id INT,
      usuario_id INT,
	    FOREIGN KEY (musica_id) REFERENCES musica(musica_id),
      FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.reproducao (data_reproducao,musica_id, usuario_id)
  VALUES
  ('2022-02-28 10:45:55', 8, 1),
	('2020-05-02 05:30:35', 2, 1),
	('2020-02-02 05:30:40', 10, 1),
	('2022-08-05 08:05:17', 10, 2),
	('2020-01-02 07:40:33', 7, 2),
  ('2020-11-13 16:55:13', 10, 3),
  ('2020-12-05 18:38:30', 2, 3),
  ('2021-08-15 17:10:10', 8, 4),
  ('2022-01-09 01:44:33', 8, 5),
  ('2020-08-06 15:23:43', 5 , 5),
  ('2017-01-24 00:31:17', 7, 6),
  ('2017-10-12 12:35:20', 1, 6),
  ('2011-12-15 22:30:49', 4, 7),
  ('2012-03-17 14:56:41', 4,8),
  ('2022-02-24 21:14:22', 9, 9),
  ('2015-12-13 08:30:22', 3, 10);
   