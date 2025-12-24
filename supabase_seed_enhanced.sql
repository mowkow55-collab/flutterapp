-- Reset table (safe for development)
TRUNCATE TABLE public.books RESTART IDENTITY CASCADE;

INSERT INTO public.books
(
  title,
  author,
  description,
  "imageUrl",
  price,
  genre,
  rating,
  pages,
  language,
  publisher,
  publication_date
)
VALUES
-- =====================
-- FICTION
-- =====================
(
  'The Great Gatsby',
  'F. Scott Fitzgerald',
  'A classic novel of the Roaring Twenties, telling the story of Jay Gatsby’s unrequited love for Daisy Buchanan.',
  'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=800',
  10.50,
  'Fiction',
  4.4,
  180,
  'English',
  'Scribner',
  '1925-04-10'
),
(
  'To Kill a Mockingbird',
  'Harper Lee',
  'A timeless novel of a childhood in a sleepy Southern town and the moral growth that follows.',
  'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=800',
  12.99,
  'Fiction',
  4.8,
  281,
  'English',
  'J.B. Lippincott & Co.',
  '1960-07-11'
),
(
  'The Midnight Library',
  'Matt Haig',
  'Between life and death there is a library. Every book provides a chance to try another life you could have lived.',
  'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=800',
  14.99,
  'Fiction',
  4.3,
  304,
  'English',
  'Canongate Books',
  '2020-09-29'
),
(
  'The Alchemist',
  'Paulo Coelho',
  'An inspiring tale of following your dreams and listening to your heart.',
  'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&q=80&w=800',
  10.99,
  'Fiction',
  4.6,
  208,
  'English',
  'HarperOne',
  '1993-01-01'
),

-- =====================
-- SCIENCE FICTION
-- =====================
(
  'Dune',
  'Frank Herbert',
  'Set on the desert planet Arrakis, Dune is a story of politics, prophecy, and survival.',
  'https://images.unsplash.com/photo-1541963463532-d68292c34b19?auto=format&fit=crop&q=80&w=800',
  18.99,
  'Sci-Fi',
  4.7,
  412,
  'English',
  'Chilton Books',
  '1965-08-01'
),
(
  'Project Hail Mary',
  'Andy Weir',
  'A lone astronaut must save humanity from extinction in this gripping sci-fi thriller.',
  'https://images.unsplash.com/photo-1614544048536-0d28caf77f41?auto=format&fit=crop&q=80&w=800',
  16.00,
  'Sci-Fi',
  4.9,
  496,
  'English',
  'Ballantine Books',
  '2021-05-04'
),
(
  'Neuromancer',
  'William Gibson',
  'The novel that launched the cyberpunk genre.',
  'https://images.unsplash.com/photo-1614544048536-0d28caf77f41?auto=format&fit=crop&q=80&w=800',
  14.50,
  'Sci-Fi',
  4.2,
  271,
  'English',
  'Ace',
  '1984-07-01'
),

-- =====================
-- TECHNOLOGY
-- =====================
(
  'Clean Code',
  'Robert C. Martin',
  'A handbook of agile software craftsmanship.',
  'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&q=80&w=800',
  35.00,
  'Technology',
  4.7,
  464,
  'English',
  'Prentice Hall',
  '2008-08-01'
),
(
  'The Pragmatic Programmer',
  'Andrew Hunt',
  'Your journey to mastery in software development.',
  'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&q=80&w=800',
  32.50,
  'Technology',
  4.8,
  352,
  'English',
  'Addison-Wesley',
  '1999-10-20'
),
(
  'Designing Data-Intensive Applications',
  'Martin Kleppmann',
  'The big ideas behind reliable, scalable, and maintainable systems.',
  'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&q=80&w=800',
  40.00,
  'Technology',
  4.9,
  616,
  'English',
  'O''Reilly Media',
  '2017-03-16'
),

-- =====================
-- BIOGRAPHY & SELF-HELP
-- =====================
(
  'Steve Jobs',
  'Walter Isaacson',
  'The exclusive biography of Apple co-founder Steve Jobs.',
  'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?auto=format&fit=crop&q=80&w=800',
  22.00,
  'Biography',
  4.6,
  656,
  'English',
  'Simon & Schuster',
  '2011-10-24'
),
(
  'Becoming',
  'Michelle Obama',
  'An intimate memoir by the former First Lady of the United States.',
  'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?auto=format&fit=crop&q=80&w=800',
  19.99,
  'Biography',
  4.8,
  448,
  'English',
  'Crown',
  '2018-11-13'
),
(
  'Atomic Habits',
  'James Clear',
  'A proven framework for building good habits and breaking bad ones.',
  'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?auto=format&fit=crop&q=80&w=800',
  12.50,
  'Self-Help',
  4.8,
  320,
  'English',
  'Avery',
  '2018-10-16'
),

-- =====================
-- HISTORY
-- =====================
(
  'Sapiens',
  'Yuval Noah Harari',
  'A brief history of humankind, from ancient times to the modern age.',
  'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=800',
  15.00,
  'History',
  4.6,
  443,
  'English',
  'Harper',
  '2015-02-10'
),
(
  'The Guns of August',
  'Barbara W. Tuchman',
  'A gripping account of the outbreak of World War I.',
  'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=800',
  13.99,
  'History',
  4.3,
  511,
  'English',
  'Macmillan',
  '1962-01-01'
);
