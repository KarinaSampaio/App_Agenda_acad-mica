use agenda_academica;

-- Contagem de Usuários por Curso
SELECT c.nome AS Curso, COUNT(u.id) AS NumeroDeUsuarios
FROM cursos c
JOIN usuarios u ON c.id = u.curso_id
GROUP BY c.nome;

-- Atividades por Tipo e Complexidade
SELECT tipo, complexidade, COUNT(*) AS Quantidade
FROM atividades
GROUP BY tipo, complexidade;

-- Atividades Futuras por Usuário
SELECT u.nome, a.titulo, a.data
FROM atividades a
JOIN usuarios u ON a.usuario_id = u.id
WHERE a.data > NOW()
ORDER BY u.nome, a.data;

-- Usuários com Maior Número de Atividades
SELECT u.nome, COUNT(a.id) AS TotalAtividades
FROM usuarios u
JOIN atividades a ON u.id = a.usuario_id
GROUP BY u.id
ORDER BY TotalAtividades DESC;

-- Atividades por Departamento
SELECT d.nome AS Departamento, COUNT(a.id) AS TotalAtividades
FROM departamentos d
JOIN cursos c ON d.id = c.departamento_id
JOIN usuarios u ON c.id = u.curso_id
JOIN atividades a ON u.id = a.usuario_id
GROUP BY d.nome;

-- Logins e Atividades Frequentes
SELECT u.nome, l.atividade, COUNT(*) AS TotalAcessos
FROM logs_acesso l
JOIN usuarios u ON l.usuario_id = u.id
GROUP BY u.nome, l.atividade
ORDER BY TotalAcessos DESC;

-- Média de Atividades por Tipo
SELECT tipo, AVG(complexidade) AS MediaComplexidade
FROM atividades
GROUP BY tipo;

--  Detalhamento de Atividades e Cursos por Departamento
SELECT d.nome AS Departamento, c.nome AS Curso, a.titulo AS Atividade, a.tipo, a.data
FROM departamentos d
JOIN cursos c ON d.id = c.departamento_id
JOIN usuarios u ON c.id = u.curso_id
JOIN atividades a ON u.id = a.usuario_id
ORDER BY Departamento, Curso, a.data;







