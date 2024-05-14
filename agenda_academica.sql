use agenda_academica;

-- Para adicionar uma nova atividade para um usuário existente:
INSERT INTO atividades (usuario_id, titulo, descricao, data, tipo, complexidade)
VALUES (1, 'Estudo de SQL', 'Revisar comandos de SELECT, INSERT, UPDATE e DELETE', '2024-05-20 09:00:00', 'Estudo', 'Média');

-- Para atualizar o endereço de e-mail de um usuário específico (por exemplo, mudar o e-mail de Alice):
UPDATE usuarios
SET email = 'novoemail@exemplo.com'
WHERE nome = 'Alice Marques';

-- DELETE FROM atividades
WHERE data < '2023-11-01 00:00:00';

-- Para excluir um curso específico (e.g., se ele não está mais ativo ou foi erroneamente inserido):
DELETE FROM cursos
WHERE nome = 'Bacharelado em Engenharia de Software';

-- Para registrar um evento de acesso de um usuário:
INSERT INTO logs_acesso (usuario_id, data_hora_acesso, atividade)
VALUES (1, NOW(), 'Submissão de trabalho');

-- Para buscar todas as atividades programadas por um usuário específico:
SELECT a.titulo, a.descricao, a.data, a.tipo, a.complexidade
FROM atividades a
JOIN usuarios u ON a.usuario_id = u.id
WHERE u.nome = 'Bob Silva';

-- Para listar todos os usuários associados a um determinado departamento:
SELECT u.nome, u.email
FROM usuarios u
JOIN cursos c ON u.curso_id = c.id
JOIN departamentos d ON c.departamento_id = d.id
WHERE d.nome = 'Ciências da Computação';

-- 

