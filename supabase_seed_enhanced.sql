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



-- =====================
-- SCIENCE FICTION
-- =====================

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
),
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
  'Ender''s Game',
  'Orson Scott Card',
  'A gifted boy is trained to defend humanity from an alien threat.',
  'https://m.media-amazon.com/images/I/71nr7G7Q%2BxL._AC_UF894%2C1000_QL80_.jpg',
  13.99,
  'Sci-Fi',
  4.7,
  324,
  'English',
  'Tor Books',
  '1985-01-15'
),

(
  'Snow Crash',
  'Neal Stephenson',
  'Cyberpunk adventure in a futuristic America dominated by corporations.',
  'https://images.unsplash.com/photo-1541963463532-d68292c34b19?auto=format&fit=crop&q=80&w=800',
  15.50,
  'Sci-Fi',
  4.5,
  480,
  'English',
  'Bantam Books',
  '1992-06-01'
),

-- =====================
-- FANTASY
-- =====================
(
  'Harry Potter and the Sorcerer''s Stone',
  'J.K. Rowling',
  'The first book in the famous Harry Potter series, introducing Hogwarts and magic.',
  'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?auto=format&fit=crop&q=80&w=800',
  12.99,
  'Fantasy',
  4.9,
  309,
  'English',
  'Bloomsbury',
  '1997-06-26'
),
(
  'The Hobbit',
  'J.R.R. Tolkien',
  'Bilbo Baggins embarks on an adventure to reclaim treasure from a dragon.',
  'https://images.unsplash.com/photo-1524985069026-dd778a71c7b4?auto=format&fit=crop&q=80&w=800',
  14.50,
  'Fantasy',
  4.8,
  310,
  'English',
  'George Allen & Unwin',
  '1937-09-21'
),

-- =====================
-- FICTION
-- =====================
(
  'The Catcher in the Rye',
  'J.D. Salinger',
  'A story about adolescent Holden Caulfield''s struggle with growing up.',
  'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&q=80&w=800',
  11.50,
  'Fiction',
  4.3,
  214,
  'English',
  'Little, Brown and Company',
  '1951-07-16'
),
(
  'The Lord of the Rings: The Fellowship of the Ring',
  'J.R.R. Tolkien',
  'Frodo Baggins begins his quest to destroy the One Ring.',
  'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&q=80&w=800',
  15.00,
  'Fiction',
  4.9,
  423,
  'English',
  'George Allen & Unwin',
  '1954-07-29'
),
(
  'Brave New World',
  'Aldous Huxley',
  'Dystopian novel exploring a futuristic society driven by technology and control.',
  'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&q=80&w=800',
  12.99,
  'Fiction',
  4.6,
  268,
  'English',
  'Chatto & Windus',
  '1932-08-01'
),

-- =====================
-- SCIENCE FICTION
-- =====================
(
  'The Martian',
  'Andy Weir',
  'An astronaut stranded on Mars must survive until rescue.',
  'https://upload.wikimedia.org/wikipedia/commons/7/71/The_Martian_%28Weir_novel%29.jpg',
  14.99,
  'Sci-Fi',
  4.8,
  369,
  'English',
  'Crown',
  '2014-02-11'
),
(
  'Foundation',
  'Isaac Asimov',
  'Epic tale of the collapse and rebirth of a galactic empire.',
  'https://covers.openlibrary.org/b/id/15122134-L.jpg',
  13.50,
  'Sci-Fi',
  4.7,
  255,
  'English',
  'Gnome Press',
  '1951-06-01'
),
(
  'Hyperion',
  'Dan Simmons',
  'A complex science fiction story with multiple intertwined narratives.',
  'https://m.media-amazon.com/images/I/81i2XR%2BFDfL._AC_UF894%2C1000_QL80_.jpg',
  16.99,
  'Sci-Fi',
  4.6,
  482,
  'English',
  'Doubleday',
  '1989-05-26'
),

-- =====================
-- FANTASY
-- =====================
(
  'The Name of the Wind',
  'Patrick Rothfuss',
  'The story of Kvothe, a magically gifted young man.',
  'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&q=80&w=800',
  14.50,
  'Fantasy',
  4.8,
  662,
  'English',
  'DAW Books',
  '2007-03-27'
),
(
  'A Game of Thrones',
  'George R.R. Martin',
  'The first book in the epic fantasy series "A Song of Ice and Fire".',
  'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&q=80&w=800',
  16.50,
  'Fantasy',
  4.7,
  694,
  'English',
  'Bantam Books',
  '1996-08-06'
),
(
  'Mistborn: The Final Empire',
  'Brandon Sanderson',
  'A story of rebellion, magic, and the rise of a new hero.',
  'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&q=80&w=800',
  13.99,
  'Fantasy',
  4.8,
  541,
  'English',
  'Tor Books',
  '2006-07-17'
),

-- =====================
-- HISTORY
-- =====================
(
  '1776',
  'David McCullough',
  'The story of the American Revolution and the founding fathers.',
  'https://images.unsplash.com/photo-1524985069026-dd778a71c7b4?auto=format&fit=crop&q=80&w=800',
  17.99,
  'History',
  4.7,
  386,
  'English',
  'Simon & Schuster',
  '2005-05-24'
),
(
  'The Rise and Fall of the Third Reich',
  'William L. Shirer',
  'Comprehensive history of Nazi Germany.',
  'https://images.unsplash.com/photo-1524985069026-dd778a71c7b4?auto=format&fit=crop&q=80&w=800',
  20.00,
  'History',
  4.6,
  1249,
  'English',
  'Simon & Schuster',
  '1960-10-17'
),

-- =====================
-- BIOGRAPHY & SELF-HELP
-- =====================
(
  'Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future',
  'Ashlee Vance',
  'Biography of the tech entrepreneur Elon Musk.',
  'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&q=80&w=800',
  18.99,
  'Biography',
  4.7,
  400,
  'English',
  'Ecco',
  '2015-05-19'
),
(
  'The Power of Habit',
  'Charles Duhigg',
  'Explains the science behind habit formation and change.',
  'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&q=80&w=800',
  13.50,
  'Self-Help',
  4.6,
  371,
  'English',
  'Random House',
  '2012-02-28'
),
(
  'How to Win Friends and Influence People',
  'Dale Carnegie',
  'Classic guide to improving personal and professional relationships.',
  'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&q=80&w=800',
  12.99,
  'Self-Help',
  4.8,
  291,
  'English',
  'Simon & Schuster',
  '1936-10-01'
),

-- =====================
-- TECHNOLOGY
-- =====================
(
  'Deep Learning',
  'Ian Goodfellow, Yoshua Bengio, Aaron Courville',
  'Comprehensive introduction to deep learning.',
  'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&q=80&w=800',
  79.99,
  'Technology',
  4.7,
  775,
  'English',
  'MIT Press',
  '2016-11-18'
),
(
  'Python Crash Course',
  'Eric Matthes',
  'A hands-on introduction to Python programming.',
  'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&q=80&w=800',
  29.99,
  'Technology',
  4.8,
  544,
  'English',
  'No Starch Press',
  '2015-11-01'
);

