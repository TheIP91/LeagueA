PGDMP     :    :                z           Serie_A    14.1    14.1 6    .           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            /           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            0           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            1           1262    49455    Serie_A    DATABASE     e   CREATE DATABASE "Serie_A" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Italian_Italy.1252';
    DROP DATABASE "Serie_A";
                postgres    false            ?            1259    49475    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            ?            1259    57719    category    TABLE     c   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(10) NOT NULL
);
    DROP TABLE public.category;
       public         heap    postgres    false            ?            1259    57718    category_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    219            2           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    218            ?            1259    57726 
   classifica    TABLE     Z  CREATE TABLE public.classifica (
    id integer NOT NULL,
    squadra integer NOT NULL,
    "Punti" integer NOT NULL,
    "Partite_Giocate" integer NOT NULL,
    "Partite_Vinte" integer NOT NULL,
    "Partite_Paregg" integer NOT NULL,
    "Partite_Perse" integer NOT NULL,
    "Goal_Fatti" integer NOT NULL,
    "Goal_Subiti" integer NOT NULL
);
    DROP TABLE public.classifica;
       public         heap    postgres    false            ?            1259    57725    classifica_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.classifica_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.classifica_id_seq;
       public          postgres    false    221            3           0    0    classifica_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.classifica_id_seq OWNED BY public.classifica.id;
          public          postgres    false    220            ?            1259    49497    contract    TABLE       CREATE TABLE public.contract (
    id integer NOT NULL,
    "StartDate" date NOT NULL,
    "EndDate" date NOT NULL,
    type character varying(10) NOT NULL,
    id_squad integer,
    id_player integer,
    "N_maglia" integer,
    ruolo character varying(10)
);
    DROP TABLE public.contract;
       public         heap    postgres    false            ?            1259    49496    contract_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.contract_id_seq;
       public          postgres    false    215            4           0    0    contract_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.contract_id_seq OWNED BY public.contract.id;
          public          postgres    false    214            ?            1259    57710    news    TABLE     K  CREATE TABLE public.news (
    id integer NOT NULL,
    category character varying(10) NOT NULL,
    title character varying(80) NOT NULL,
    content character varying(1400),
    hash1 character varying(10),
    hash2 character varying(10),
    hash3 character varying(10),
    "DateW" date,
    "srcImg" character varying(30)
);
    DROP TABLE public.news;
       public         heap    postgres    false            ?            1259    57709    news_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.news_id_seq;
       public          postgres    false    217            5           0    0    news_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;
          public          postgres    false    216            ?            1259    49481    player    TABLE     ?   CREATE TABLE public.player (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    surname character varying(30) NOT NULL,
    age integer NOT NULL,
    sopran character varying(30),
    naz character varying(10)
);
    DROP TABLE public.player;
       public         heap    postgres    false            ?            1259    49480    player_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.player_id_seq;
       public          postgres    false    211            6           0    0    player_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.player_id_seq OWNED BY public.player.id;
          public          postgres    false    210            ?            1259    49488    squad    TABLE     )  CREATE TABLE public.squad (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    nick character varying(30) NOT NULL,
    prov character varying,
    "bornDate" integer,
    "Pres" character varying(40),
    "VicePres" character varying(60),
    "Stadio" character varying(40)
);
    DROP TABLE public.squad;
       public         heap    postgres    false            ?            1259    49487    squad_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.squad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.squad_id_seq;
       public          postgres    false    213            7           0    0    squad_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.squad_id_seq OWNED BY public.squad.id;
          public          postgres    false    212            }           2604    57722    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            ~           2604    57729    classifica id    DEFAULT     n   ALTER TABLE ONLY public.classifica ALTER COLUMN id SET DEFAULT nextval('public.classifica_id_seq'::regclass);
 <   ALTER TABLE public.classifica ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            {           2604    49500    contract id    DEFAULT     j   ALTER TABLE ONLY public.contract ALTER COLUMN id SET DEFAULT nextval('public.contract_id_seq'::regclass);
 :   ALTER TABLE public.contract ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            |           2604    57713    news id    DEFAULT     b   ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);
 6   ALTER TABLE public.news ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            y           2604    49484 	   player id    DEFAULT     f   ALTER TABLE ONLY public.player ALTER COLUMN id SET DEFAULT nextval('public.player_id_seq'::regclass);
 8   ALTER TABLE public.player ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            z           2604    49491    squad id    DEFAULT     d   ALTER TABLE ONLY public.squad ALTER COLUMN id SET DEFAULT nextval('public.squad_id_seq'::regclass);
 7   ALTER TABLE public.squad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213                      0    49475    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    209   S<       )          0    57719    category 
   TABLE DATA           ,   COPY public.category (id, name) FROM stdin;
    public          postgres    false    219   }<       +          0    57726 
   classifica 
   TABLE DATA           ?   COPY public.classifica (id, squadra, "Punti", "Partite_Giocate", "Partite_Vinte", "Partite_Paregg", "Partite_Perse", "Goal_Fatti", "Goal_Subiti") FROM stdin;
    public          postgres    false    221   ?<       %          0    49497    contract 
   TABLE DATA           l   COPY public.contract (id, "StartDate", "EndDate", type, id_squad, id_player, "N_maglia", ruolo) FROM stdin;
    public          postgres    false    215   ?=       '          0    57710    news 
   TABLE DATA           d   COPY public.news (id, category, title, content, hash1, hash2, hash3, "DateW", "srcImg") FROM stdin;
    public          postgres    false    217   ?=       !          0    49481    player 
   TABLE DATA           E   COPY public.player (id, name, surname, age, sopran, naz) FROM stdin;
    public          postgres    false    211   6D       #          0    49488    squad 
   TABLE DATA           _   COPY public.squad (id, name, nick, prov, "bornDate", "Pres", "VicePres", "Stadio") FROM stdin;
    public          postgres    false    213   ?D       8           0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 1, false);
          public          postgres    false    218            9           0    0    classifica_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.classifica_id_seq', 20, true);
          public          postgres    false    220            :           0    0    contract_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.contract_id_seq', 4, true);
          public          postgres    false    214            ;           0    0    news_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.news_id_seq', 5, true);
          public          postgres    false    216            <           0    0    player_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.player_id_seq', 5, true);
          public          postgres    false    210            =           0    0    squad_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.squad_id_seq', 22, true);
          public          postgres    false    212            ?           2606    49479 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    209            ?           2606    57724    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    219            ?           2606    57731    classifica classifica_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.classifica
    ADD CONSTRAINT classifica_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.classifica DROP CONSTRAINT classifica_pkey;
       public            postgres    false    221            ?           2606    49502    contract contract_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.contract DROP CONSTRAINT contract_pkey;
       public            postgres    false    215            ?           2606    57717    news news_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
       public            postgres    false    217            ?           2606    49486    player player_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.player DROP CONSTRAINT player_pkey;
       public            postgres    false    211            ?           2606    49516    player player_sopran_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_sopran_key UNIQUE (sopran);
 B   ALTER TABLE ONLY public.player DROP CONSTRAINT player_sopran_key;
       public            postgres    false    211            ?           2606    49518    squad squad_nick_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.squad
    ADD CONSTRAINT squad_nick_key UNIQUE (nick);
 >   ALTER TABLE ONLY public.squad DROP CONSTRAINT squad_nick_key;
       public            postgres    false    213            ?           2606    49493    squad squad_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.squad
    ADD CONSTRAINT squad_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.squad DROP CONSTRAINT squad_pkey;
       public            postgres    false    213            ?           2606    57732 "   classifica classifica_squadra_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.classifica
    ADD CONSTRAINT classifica_squadra_fkey FOREIGN KEY (squadra) REFERENCES public.squad(id);
 L   ALTER TABLE ONLY public.classifica DROP CONSTRAINT classifica_squadra_fkey;
       public          postgres    false    221    213    3208            ?           2606    49503     contract contract_id_player_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_id_player_fkey FOREIGN KEY (id_player) REFERENCES public.player(id);
 J   ALTER TABLE ONLY public.contract DROP CONSTRAINT contract_id_player_fkey;
       public          postgres    false    3202    211    215            ?           2606    49508    contract contract_id_squad_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_id_squad_fkey FOREIGN KEY (id_squad) REFERENCES public.squad(id);
 I   ALTER TABLE ONLY public.contract DROP CONSTRAINT contract_id_squad_fkey;
       public          postgres    false    3208    213    215                  x?36NM?06HM1M6?????? ,?      )      x?????? ? ?      +   ?   x?-QɍE1;?bFaM??ￎ1?I9 c?cZ?
w?? ?v?pQn???Q?S???^?(??m	??Ӄ??"	ݭ??&?"?????Vot!??ʃ{??D9?D?????9r{2??U?m???^?S?f}-?k??<???8?-6?؈+T????iNg),???Eg?3Z??F?'??E???&?3?%L?j6???F??ȷ~\???#ƈ??|??GGƥ???R??H?S~"?$CF?      %   3   x?3?420??50?54@f:&?f??s??q???."?A???qqq ?G      '   F  x??VKnG]K?(h	?(Q??nD???(???4?M????q??h?kH?,?? ??&>I^???N?d@ ??UիW??h+hϚ?V?G?I2IǓ???G??~?????~??t8?N&???YG3??<e?-??EA????v.]V?ږ?C3mȺPzG?K?"?)???Prv???ʗ\*??`g	7?-??r/???y?p?^G???::<????}g?lj(?u?2?0o?X?P9?h???\S???<???D?9?^?0?be?,3??s??%??!?łq?
?L?g?{?f??"/dx?ؒZ*+g???f??S?vA??{??>?{W???1?r?/?U???b?y??????L33Eg???????qa?v??SЋJ???Ԗ?Ã??e???5????mJ??^,4p/?>/?*
????8?????????(-??? #???Є(։T*˜?/???F???y??׋uB?[w?͟dt??d?s?e??p ?G???b?xM؋axu???{?????L?X?O??/??5?x|????'??s?n.??4?ʸ\? ?r???%X??????Pe??E:?`Μ0???`??yV????ǟ??P?ǪEs?ʈ??U?jp(c+?W?r?<R??P 8Z?L??t?
???Ã?B????6LP˪?mB ?q,???S)2\p?%?????NR?l]?Ȑ?H?lK:G?+/?R^?B=pd??????s??¿???F?7Ȼ??~W橗j?@????*P:sl?N?3jM5?%e????G?D???pD*O2Z???H?Pզ.?\Q???-?L\??/???"P?????r?&??e?|?E?xW???f????_??q?ngM?qo??	??^??)??m:?N)]??Q?OW"|????:0?c?.? ?YK??r鹵?	!?@R?U??n?P6V?Yy?NڣvT?x?Z1?3?yP??Q??????~??&k??\?V??=CL(/i(?%X;֓?u??G?ԣ??(??????w5?9g3SE????71?k??????78?G?5 ?	C???>??*fo7J??(??y?
b3BZ??Ȩ????|?7hVE]??Rt?,`?????i?????W??7b%'}jj*??Jx??į?<A)w??l????? ???6??yQ?5XӲv1?^??~CE*?O?????n?????/???g?3???E&Dkѷ?)?Ϡ?A??5>qh?O?<wK4z?ə??{??o??T???^T?}??w????s?/Y|&??A5Q???C?E?UƵ D߈)~wNN#PwNW???`?uCWs???K?K1????/9?L?IdO?D;% Y??VEkpv??!Q??(T?Ōg??P??aP?;'???ǘ΍??f?`6Z????t?
4s??/E?ͫ?H??A?tM?,?B??4Ss??@	B?B?j?(?uS?(?/wN??n?????ǘ???p?0:^??X/s????2?e:?"N8???t??&??
nU?y׫?%?9??s???Ir=?z?^AoPU??V??x??1?I޾1
C?P?%?@>[q`?V??H?[ j ?v^?8?
t?VQ?y?-Je?`?'S/???y????ӈ?]{{{?O?sP?      !   i   x?=˽@0?????E??o00?-%'8???ס??ۓ7A??04?~A&?G??h???e:5d ?????%?????I??{(?h-???N??40GB??}$	      #   ?  x?mS?n?0=?_??8k????M??͊?ݩ?f??Jv??G?????~$?9??|?Q??Ό0??v
o??'Y?V??MM????AM^??5;??i??#c.?i\9?E断#S?A???,?L???1??:Z?0#?M?n??Cve?v?`u,?kM????M??/?+?aȼ????`PIB??8?:??d?ir?}??k??hZ?c?eJ??=߆!]-??5?4[uG??0????G#?|S??EW??O谔?I??=?;??o[??,Q?/?Ց???`j?9?:?0W???o?K?
B???R?{?5\???6g?Gb?k,???<4'???`~?r??r
?)???????'?jO??J?????c?t??7?Ψ?E??l?֡)?Z?#QٮA|x-?oO0??bJnu?5C^ӻ????P?*w(??d???hVV?h?z?&w??U5]F?w????t2??/z????]???$I?nMT?     