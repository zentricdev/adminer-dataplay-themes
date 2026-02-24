-- 1. TIPOS Y FUNCIONES GLOBALES
CREATE TYPE public.user_role AS ENUM ('admin', 'author');

CREATE OR REPLACE FUNCTION public.update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2. TABLA: USERS
CREATE TABLE public.users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role public.user_role NOT NULL DEFAULT 'author',
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER trig_users_updated_at
BEFORE UPDATE ON public.users
FOR EACH ROW
EXECUTE FUNCTION public.update_timestamp();

-- 3. TABLA: POSTS (Versión simplificada)
CREATE TABLE public.posts (
    id SERIAL PRIMARY KEY,
    author_id INTEGER NOT NULL,
    pub_date DATE DEFAULT CURRENT_DATE,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    CONSTRAINT fk_author FOREIGN KEY(author_id) REFERENCES public.users(id) ON DELETE CASCADE
);

-- 4. SEED: USERS
INSERT INTO public.users ("username", "email", "password", "role", "created_at", "updated_at") VALUES
('admin',   'admin@example.com',    '5f4dcc3b5aa765d61d8327deb882cf99', 'admin',    '2026-02-24 11:32:32+00',    '2026-02-24 11:32:32+00'),
('user01',  'user01@example.com',   '5f4dcc3b5aa765d61d8327deb882cf99', 'author',     '2026-02-24 11:32:32+00',    '2026-02-24 11:32:32+00'),
('user02',  'user02@example.com',   '5f4dcc3b5aa765d61d8327deb882cf99', 'author',     '2026-02-24 11:32:32+00',    '2026-02-24 11:32:32+00'),
('user03',  'user03@example.com',   '5f4dcc3b5aa765d61d8327deb882cf99', 'author',     '2026-02-24 11:32:32+00',    '2026-02-24 11:32:32+00'),
('user04',  'user04@example.com',   '5f4dcc3b5aa765d61d8327deb882cf99', 'author',     '2026-02-24 11:32:32+00',    '2026-02-24 11:32:32+00'),
('user05',  'user05@example.com',   '5f4dcc3b5aa765d61d8327deb882cf99', 'author',     '2026-02-24 11:32:32+00',    '2026-02-24 11:32:32+00');

-- 5. SEED: POSTS
INSERT INTO public.posts (author_id, title, pub_date, content) VALUES
(1, 'Lorem Ipsum Dolor Sit Amet', '2026-02-24',
 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' || E'\n\n' ||
 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' || E'\n\n' ||
 'Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida.'),
(3, 'Lorem Ipsum Dolor Sit Amet', '2026-02-24',
 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' || E'\n\n' ||
 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' || E'\n\n' ||
 'Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida.'),
(4, 'Lorem Ipsum Dolor Sit Amet', '2026-01-24',
 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' || E'\n\n' ||
 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' || E'\n\n' ||
 'Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida.'),
(1, 'Lorem Ipsum Dolor Sit Amet', '2026-02-12',
 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' || E'\n\n' ||
 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' || E'\n\n' ||
 'Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida.'),
(2, 'Consectetur Adipiscing Elit', '2026-02-05',
 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam id diam maecenas ultricies mi eget mauris pharetra. Morbi tristique senectus et netus et malesuada fames ac turpis egestas.' || E'\n\n' ||
 'In hac habitasse platea dictumst quisque sagittis purus sit. Scelerisque eleifend donec pretium vulputate sapien nec sagittis aliquam. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi.' || E'\n\n' ||
 'Porttitor massa id neque aliquam vestibulum morbi blandit cursus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames. Pellentesque elit eget gravida cum sociis natoque.');
