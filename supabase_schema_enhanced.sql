DROP TABLE IF EXISTS public.books CASCADE;

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Recreate books table
CREATE TABLE public.books (
  id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  title text NOT NULL,
  author text NOT NULL,
  description text,
  "imageUrl" text,
  price numeric(10,2) NOT NULL,
  genre text,
  rating numeric(2,1) CHECK (rating >= 0 AND rating <= 5),
  pages int,
  language text DEFAULT 'English',
  publisher text,
  publication_date date,
  stock int DEFAULT 0,
  is_active boolean DEFAULT true,
  created_at timestamp with time zone
    DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE public.books ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Books are viewable by everyone"
ON public.books
FOR SELECT
USING ( true );
