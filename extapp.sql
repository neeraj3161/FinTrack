PGDMP                      }            extapp    16.9    16.9     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16388    extapp    DATABASE     �   CREATE DATABASE extapp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE extapp;
                postgres    false                        2615    16389    ext    SCHEMA        CREATE SCHEMA ext;
    DROP SCHEMA ext;
                postgres    false            �            1259    16391 
   categories    TABLE     �   CREATE TABLE ext.categories (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone DEFAULT now()
);
    DROP TABLE ext.categories;
       ext         heap    postgres    false    6            �            1259    16390    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE ext.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE ext.categories_id_seq;
       ext          postgres    false    6    217            �           0    0    categories_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE ext.categories_id_seq OWNED BY ext.categories.id;
          ext          postgres    false    216            �            1259    16409    expenses    TABLE       CREATE TABLE ext.expenses (
    id integer NOT NULL,
    amount double precision NOT NULL,
    category_id integer,
    summary text,
    mode integer,
    created_at timestamp without time zone DEFAULT now(),
    modified_at timestamp without time zone DEFAULT now()
);
    DROP TABLE ext.expenses;
       ext         heap    postgres    false    6            �            1259    16408    expenses_id_seq    SEQUENCE     �   CREATE SEQUENCE ext.expenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE ext.expenses_id_seq;
       ext          postgres    false    221    6            �           0    0    expenses_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE ext.expenses_id_seq OWNED BY ext.expenses.id;
          ext          postgres    false    220            �            1259    16401    mode    TABLE     �   CREATE TABLE ext.mode (
    id integer NOT NULL,
    name character varying(20),
    description character varying(225),
    created_at timestamp without time zone DEFAULT now()
);
    DROP TABLE ext.mode;
       ext         heap    postgres    false    6            �            1259    16400    mode_id_seq    SEQUENCE     �   CREATE SEQUENCE ext.mode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE ext.mode_id_seq;
       ext          postgres    false    219    6            �           0    0    mode_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE ext.mode_id_seq OWNED BY ext.mode.id;
          ext          postgres    false    218            %           2604    16394    categories id    DEFAULT     h   ALTER TABLE ONLY ext.categories ALTER COLUMN id SET DEFAULT nextval('ext.categories_id_seq'::regclass);
 9   ALTER TABLE ext.categories ALTER COLUMN id DROP DEFAULT;
       ext          postgres    false    217    216    217            )           2604    16412    expenses id    DEFAULT     d   ALTER TABLE ONLY ext.expenses ALTER COLUMN id SET DEFAULT nextval('ext.expenses_id_seq'::regclass);
 7   ALTER TABLE ext.expenses ALTER COLUMN id DROP DEFAULT;
       ext          postgres    false    221    220    221            '           2604    16404    mode id    DEFAULT     \   ALTER TABLE ONLY ext.mode ALTER COLUMN id SET DEFAULT nextval('ext.mode_id_seq'::regclass);
 3   ALTER TABLE ext.mode ALTER COLUMN id DROP DEFAULT;
       ext          postgres    false    219    218    219            �          0    16391 
   categories 
   TABLE DATA           7   COPY ext.categories (id, name, created_at) FROM stdin;
    ext          postgres    false    217   (       �          0    16409    expenses 
   TABLE DATA           `   COPY ext.expenses (id, amount, category_id, summary, mode, created_at, modified_at) FROM stdin;
    ext          postgres    false    221   �       �          0    16401    mode 
   TABLE DATA           >   COPY ext.mode (id, name, description, created_at) FROM stdin;
    ext          postgres    false    219   �       �           0    0    categories_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('ext.categories_id_seq', 14, true);
          ext          postgres    false    216            �           0    0    expenses_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('ext.expenses_id_seq', 17, true);
          ext          postgres    false    220            �           0    0    mode_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('ext.mode_id_seq', 3, true);
          ext          postgres    false    218            -           2606    16396    categories categories_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY ext.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY ext.categories DROP CONSTRAINT categories_pkey;
       ext            postgres    false    217            3           2606    16418    expenses expenses_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY ext.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY ext.expenses DROP CONSTRAINT expenses_pkey;
       ext            postgres    false    221            1           2606    16406    mode mode_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY ext.mode
    ADD CONSTRAINT mode_pkey PRIMARY KEY (id);
 5   ALTER TABLE ONLY ext.mode DROP CONSTRAINT mode_pkey;
       ext            postgres    false    219            /           2606    16398    categories unique_category_name 
   CONSTRAINT     W   ALTER TABLE ONLY ext.categories
    ADD CONSTRAINT unique_category_name UNIQUE (name);
 F   ALTER TABLE ONLY ext.categories DROP CONSTRAINT unique_category_name;
       ext            postgres    false    217            4           2606    16419 "   expenses expenses_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY ext.expenses
    ADD CONSTRAINT expenses_category_id_fkey FOREIGN KEY (category_id) REFERENCES ext.categories(id);
 I   ALTER TABLE ONLY ext.expenses DROP CONSTRAINT expenses_category_id_fkey;
       ext          postgres    false    221    4653    217            5           2606    16424    expenses expenses_mode_fkey    FK CONSTRAINT     p   ALTER TABLE ONLY ext.expenses
    ADD CONSTRAINT expenses_mode_fkey FOREIGN KEY (mode) REFERENCES ext.mode(id);
 B   ALTER TABLE ONLY ext.expenses DROP CONSTRAINT expenses_mode_fkey;
       ext          postgres    false    4657    219    221            �   �   x�}�AN�@�����@F~��cf�k��&@$(U���Tj@jP��~���5N�$,�c�pSil9�B�Nס�=��^����������e<�署ޮ�R��v��ěy�R��mTm(b#�/۸h�\��V���"D�	��a��/�Z.H�(.]�l�)��<[�>2k\2�W�����re�      �   �   x���A
1EדSx�)�Iڦ=�u�����,ѩnB���ǔ�'L�z]��-6a�3י����u��P�6@$y�Wo�����4�"�F�jx"|:_� �u�T�K�"DP"���Z�&nb�D(A'�6_���U�yre�}B�[־����=��\�      �   R   x�3�,-�a�����Լ����TN##S]3]CC+C+CS=C#K#.#�����G�1grF!���5.F��� �Rp     