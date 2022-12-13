SELECT * FROM clientes;

SELECT * FROM provincias;

SELECT p.nombre FROM provincias p WHERE NOT EXISTS (SELECT codigoProvincia AS codigo FROM clientes WHERE p.codigo = codigoProvincia GROUP BY codigoProvincia);
SELECT p.nombre FROM provincias p LEFT JOIN (SELECT codigoProvincia AS codigo FROM clientes GROUP BY codigoProvincia) c ON p.codigo=c.codigo WHERE c.codigo IS NULL;

SELECT p.nombre FROM provincias p WHERE (SELECT codigoProvincia as codigo FROM clientes WHERE p.codigo = codigoProvincia group by codigoProvincia);
SELECT p.nombre FROM provincias p LEFT JOIN (SELECT codigoProvincia as codigo FROM clientes GROUP BY codigoProvincia) c ON p.codigo=c.codigo WHERE p.codigo = c.codigo;