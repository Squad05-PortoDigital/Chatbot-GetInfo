PGDMP  ,    (                |            chatbotgetin    15.7    16.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24585    chatbotgetin    DATABASE     �   CREATE DATABASE chatbotgetin WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE chatbotgetin;
                postgres    false            �            1259    24594    chatbot    TABLE     �  CREATE TABLE public.chatbot (
    "idProcesso" bigint NOT NULL,
    funcionario bigint,
    "tipoProcesso" character varying(255) NOT NULL,
    "dataSolicitacao" date NOT NULL,
    status character varying(255) DEFAULT 'Pendente'::character varying,
    descricao character varying(255),
    id_processo bigint NOT NULL,
    data_solicitacao date,
    tipo_processo character varying(255)
);
    DROP TABLE public.chatbot;
       public         heap    postgres    false            �            1259    24649    chatbot_id_processo_seq    SEQUENCE     �   ALTER TABLE public.chatbot ALTER COLUMN id_processo ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.chatbot_id_processo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    24593    chatbot_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chatbot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.chatbot_id_seq;
       public          postgres    false    217                       0    0    chatbot_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.chatbot_id_seq OWNED BY public.chatbot."idProcesso";
          public          postgres    false    216            �            1259    24587    funcionarios    TABLE     �   CREATE TABLE public.funcionarios (
    id bigint NOT NULL,
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
       public          postgres    false    215                       0    0    funcionarios_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.funcionarios_id_seq OWNED BY public.funcionarios.id;
          public          postgres    false    214            l           2604    24608    chatbot idProcesso    DEFAULT     r   ALTER TABLE ONLY public.chatbot ALTER COLUMN "idProcesso" SET DEFAULT nextval('public.chatbot_id_seq'::regclass);
 C   ALTER TABLE public.chatbot ALTER COLUMN "idProcesso" DROP DEFAULT;
       public          postgres    false    216    217    217            k           2604    24635    funcionarios id    DEFAULT     r   ALTER TABLE ONLY public.funcionarios ALTER COLUMN id SET DEFAULT nextval('public.funcionarios_id_seq'::regclass);
 >   ALTER TABLE public.funcionarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215                      0    24594    chatbot 
   TABLE DATA           �   COPY public.chatbot ("idProcesso", funcionario, "tipoProcesso", "dataSolicitacao", status, descricao, id_processo, data_solicitacao, tipo_processo) FROM stdin;
    public          postgres    false    217                    0    24587    funcionarios 
   TABLE DATA           E   COPY public.funcionarios (id, nome, email, setor, cargo) FROM stdin;
    public          postgres    false    215   �                  0    0    chatbot_id_processo_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.chatbot_id_processo_seq', 3, true);
          public          postgres    false    218                       0    0    chatbot_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.chatbot_id_seq', 3, true);
          public          postgres    false    216                       0    0    funcionarios_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.funcionarios_id_seq', 2, true);
          public          postgres    false    214            q           2606    24610    chatbot chatbot_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.chatbot
    ADD CONSTRAINT chatbot_pkey PRIMARY KEY ("idProcesso");
 >   ALTER TABLE ONLY public.chatbot DROP CONSTRAINT chatbot_pkey;
       public            postgres    false    217            o           2606    24637    funcionarios funcionarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_pkey;
       public            postgres    false    215            r           2606    24638 "   chatbot chatbot_funcionarioid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatbot
    ADD CONSTRAINT chatbot_funcionarioid_fkey FOREIGN KEY (funcionario) REFERENCES public.funcionarios(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.chatbot DROP CONSTRAINT chatbot_funcionarioid_fkey;
       public          postgres    false    3183    217    215               �   x�u�1
1@�z����&�l�	��⬌č��Y����
����sN�P}�Gv'vK}��A�v��O�vc%ػ���_�G}��14gEe=�|a)�Q�Í�d�-COw�k�g77��y-?=         I   x�3�t/���H-�MU��)K�,I-.I543�pH�M���K�����t�K��,.ITHIU(2Rs��b����  �     