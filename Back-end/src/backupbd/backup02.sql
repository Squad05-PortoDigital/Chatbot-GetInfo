PGDMP  8                	    |            chatbotgetin    15.7    16.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            
           1262    24585    chatbotgetin    DATABASE     �   CREATE DATABASE chatbotgetin WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE chatbotgetin;
                postgres    false            �            1259    24594    chatbot    TABLE     �  CREATE TABLE public.chatbot (
    id_ocorrencia bigint NOT NULL,
    id_funcionario bigint,
    tipo_processo character varying(255) NOT NULL,
    data_solicitacao date NOT NULL,
    status character varying(255) DEFAULT 'Pendente'::character varying,
    descricao character varying(255),
    urgencia character varying(255) DEFAULT 'Normal'::character varying,
    id_destinatario bigint,
    caminho_arquivo character varying(255)
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
       public          postgres    false    217                       0    0    chatbot_id_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.chatbot_id_seq OWNED BY public.chatbot.id_ocorrencia;
          public          postgres    false    216            �            1259    24587    funcionarios    TABLE     �   CREATE TABLE public.funcionarios (
    id_funcionario bigint NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    setor character varying(255),
    cargo character varying(255)
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
       public          postgres    false    215                       0    0    funcionarios_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.funcionarios_id_seq OWNED BY public.funcionarios.id_funcionario;
          public          postgres    false    214            k           2604    24673    chatbot id_ocorrencia    DEFAULT     s   ALTER TABLE ONLY public.chatbot ALTER COLUMN id_ocorrencia SET DEFAULT nextval('public.chatbot_id_seq'::regclass);
 D   ALTER TABLE public.chatbot ALTER COLUMN id_ocorrencia DROP DEFAULT;
       public          postgres    false    217    216    217            j           2604    24674    funcionarios id_funcionario    DEFAULT     ~   ALTER TABLE ONLY public.funcionarios ALTER COLUMN id_funcionario SET DEFAULT nextval('public.funcionarios_id_seq'::regclass);
 J   ALTER TABLE public.funcionarios ALTER COLUMN id_funcionario DROP DEFAULT;
       public          postgres    false    214    215    215                      0    24594    chatbot 
   TABLE DATA           �   COPY public.chatbot (id_ocorrencia, id_funcionario, tipo_processo, data_solicitacao, status, descricao, urgencia, id_destinatario, caminho_arquivo) FROM stdin;
    public          postgres    false    217   S                 0    24587    funcionarios 
   TABLE DATA           Q   COPY public.funcionarios (id_funcionario, nome, email, setor, cargo) FROM stdin;
    public          postgres    false    215   �                  0    0    chatbot_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.chatbot_id_seq', 4, true);
          public          postgres    false    216                       0    0    funcionarios_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.funcionarios_id_seq', 2, true);
          public          postgres    false    214            q           2606    24610    chatbot chatbot_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.chatbot
    ADD CONSTRAINT chatbot_pkey PRIMARY KEY (id_ocorrencia);
 >   ALTER TABLE ONLY public.chatbot DROP CONSTRAINT chatbot_pkey;
       public            postgres    false    217            o           2606    24637    funcionarios funcionarios_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (id_funcionario);
 H   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_pkey;
       public            postgres    false    215            r           2606    24638 "   chatbot chatbot_funcionarioid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatbot
    ADD CONSTRAINT chatbot_funcionarioid_fkey FOREIGN KEY (id_funcionario) REFERENCES public.funcionarios(id_funcionario) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.chatbot DROP CONSTRAINT chatbot_funcionarioid_fkey;
       public          postgres    false    3183    215    217               �   x�M�M
�0FדS��&��^B��q"!�x"�s�b�����{|,hɜ��&7��:�q8e�2\hP��Y�a;�1����s�������gF��5;ܒgI=�ȓj�t����|�fnU�J�K���'&l��r��1�	z�;�         I   x�3�t/���H-�MU��)K�,I-.I543�pH�M���K�����t�K��,.ITHIU(2Rs��b����  �     