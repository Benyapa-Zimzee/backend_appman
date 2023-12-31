PGDMP     )    "                {            education_db    15.4    15.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    education_db    DATABASE     �   CREATE DATABASE education_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE education_db;
                postgres    false            �            1259    16404    students    TABLE     k   CREATE TABLE public.students (
    std_id integer NOT NULL,
    std_name character varying(50) NOT NULL
);
    DROP TABLE public.students;
       public         heap    postgres    false            �            1259    16433    students_universities    TABLE     �   CREATE TABLE public.students_universities (
    std_uni_id integer NOT NULL,
    std_id integer NOT NULL,
    uni_id integer NOT NULL
);
 )   DROP TABLE public.students_universities;
       public         heap    postgres    false            �            1259    16432 $   students_universities_std_uni_id_seq    SEQUENCE     �   CREATE SEQUENCE public.students_universities_std_uni_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.students_universities_std_uni_id_seq;
       public          postgres    false    217                       0    0 $   students_universities_std_uni_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.students_universities_std_uni_id_seq OWNED BY public.students_universities.std_uni_id;
          public          postgres    false    216            �            1259    16399    universities    TABLE     o   CREATE TABLE public.universities (
    uni_id integer NOT NULL,
    uni_name character varying(50) NOT NULL
);
     DROP TABLE public.universities;
       public         heap    postgres    false            m           2604    16436     students_universities std_uni_id    DEFAULT     �   ALTER TABLE ONLY public.students_universities ALTER COLUMN std_uni_id SET DEFAULT nextval('public.students_universities_std_uni_id_seq'::regclass);
 O   ALTER TABLE public.students_universities ALTER COLUMN std_uni_id DROP DEFAULT;
       public          postgres    false    216    217    217                      0    16404    students 
   TABLE DATA           4   COPY public.students (std_id, std_name) FROM stdin;
    public          postgres    false    215   N       	          0    16433    students_universities 
   TABLE DATA           K   COPY public.students_universities (std_uni_id, std_id, uni_id) FROM stdin;
    public          postgres    false    217   y                 0    16399    universities 
   TABLE DATA           8   COPY public.universities (uni_id, uni_name) FROM stdin;
    public          postgres    false    214   �                  0    0 $   students_universities_std_uni_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.students_universities_std_uni_id_seq', 2, true);
          public          postgres    false    216            q           2606    16408    students students_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (std_id);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
       public            postgres    false    215            u           2606    16438 0   students_universities students_universities_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.students_universities
    ADD CONSTRAINT students_universities_pkey PRIMARY KEY (std_uni_id);
 Z   ALTER TABLE ONLY public.students_universities DROP CONSTRAINT students_universities_pkey;
       public            postgres    false    217            o           2606    16403    universities universities_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_pkey PRIMARY KEY (uni_id);
 H   ALTER TABLE ONLY public.universities DROP CONSTRAINT universities_pkey;
       public            postgres    false    214            r           1259    16444 
   fki_std_id    INDEX     N   CREATE INDEX fki_std_id ON public.students_universities USING btree (std_id);
    DROP INDEX public.fki_std_id;
       public            postgres    false    217            s           1259    16450 
   fki_uni_id    INDEX     N   CREATE INDEX fki_uni_id ON public.students_universities USING btree (uni_id);
    DROP INDEX public.fki_uni_id;
       public            postgres    false    217            v           2606    16439    students_universities std_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.students_universities
    ADD CONSTRAINT std_id FOREIGN KEY (std_id) REFERENCES public.students(std_id);
 F   ALTER TABLE ONLY public.students_universities DROP CONSTRAINT std_id;
       public          postgres    false    215    217    3185            w           2606    16445    students_universities uni_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.students_universities
    ADD CONSTRAINT uni_id FOREIGN KEY (uni_id) REFERENCES public.universities(uni_id);
 F   ALTER TABLE ONLY public.students_universities DROP CONSTRAINT uni_id;
       public          postgres    false    3183    214    217                  x�333� NG.3(ۈӉ+F��� N��      	      x�3�433� NCC.#�W� u��         #   x�340���	�240��RƜΡ\1z\\\ X�h     