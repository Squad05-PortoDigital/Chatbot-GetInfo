PGDMP  &                    |            chatbotgetin    15.7    16.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            	           1262    24585    chatbotgetin    DATABASE     �   CREATE DATABASE chatbotgetin WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE chatbotgetin;
                postgres    false            �            1259    24594    chatbot    TABLE       CREATE TABLE public.chatbot (
    id integer NOT NULL,
    funcionarioid integer,
    tipoprocesso character varying(50) NOT NULL,
    datasolicitacao date NOT NULL,
    status character varying(20) DEFAULT 'Pendente'::character varying,
    descricao text
);
    DROP TABLE public.chatbot;
       public         heap    postgres    false            �            1259    24593    chatbot_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chatbot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.chatbot_id_seq;
       public          postgres    false    217            
           0    0    chatbot_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.chatbot_id_seq OWNED BY public.chatbot.id;
          public          postgres    false    216            �            1259    24587    funcionarios    TABLE     �   CREATE TABLE public.funcionarios (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    email character varying(60) NOT NULL,
    setor character varying(25),
    cargo character varying(25)
);
     DROP TABLE public.funcionarios;
       public         heap    postgres    false            �            1259    24586    funcionarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.funcionarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.funcionarios_id_seq;
       public          postgres    false    215                       0    0    funcionarios_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.funcionarios_id_seq OWNED BY public.funcionarios.id;
          public          postgres    false    214            k           2604    24597 
   chatbot id    DEFAULT     h   ALTER TABLE ONLY public.chatbot ALTER COLUMN id SET DEFAULT nextval('public.chatbot_id_seq'::regclass);
 9   ALTER TABLE public.chatbot ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            j           2604    24590    funcionarios id    DEFAULT     r   ALTER TABLE ONLY public.funcionarios ALTER COLUMN id SET DEFAULT nextval('public.funcionarios_id_seq'::regclass);
 >   ALTER TABLE public.funcionarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215                      0    24594    chatbot 
   TABLE DATA           f   COPY public.chatbot (id, funcionarioid, tipoprocesso, datasolicitacao, status, descricao) FROM stdin;
    public          postgres    false    217   �                 0    24587    funcionarios 
   TABLE DATA           E   COPY public.funcionarios (id, nome, email, setor, cargo) FROM stdin;
    public          postgres    false    215   �                  0    0    chatbot_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.chatbot_id_seq', 1, false);
          public          postgres    false    216                       0    0    funcionarios_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.funcionarios_id_seq', 1, false);
          public          postgres    false    214            p           2606    24602    chatbot chatbot_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.chatbot
    ADD CONSTRAINT chatbot_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.chatbot DROP CONSTRAINT chatbot_pkey;
       public            postgres    false    217            n           2606    24592    funcionarios funcionarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_pkey;
       public            postgres    false    215            q           2606    24603 "   chatbot chatbot_funcionarioid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatbot
    ADD CONSTRAINT chatbot_funcionarioid_fkey FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.chatbot DROP CONSTRAINT chatbot_funcionarioid_fkey;
       public          postgres    false    215    217    3182                  x������ � �            x������ � �     