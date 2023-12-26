--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-12-26 22:55:02

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4887 (class 1262 OID 28958)
-- Name: car_dealership; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE car_dealership WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE car_dealership OWNER TO postgres;

\connect car_dealership

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 232 (class 1259 OID 29082)
-- Name: __MigrationHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__MigrationHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ContextKey" character varying(300) NOT NULL,
    "Model" bytea NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__MigrationHistory" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 29029)
-- Name: _cars_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._cars_options (
    "optionId" bigint NOT NULL,
    "carId" bigint NOT NULL
);


ALTER TABLE public._cars_options OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 28960)
-- Name: accessory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accessory (
    id integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    count integer NOT NULL,
    status boolean NOT NULL
);


ALTER TABLE public.accessory OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 28969)
-- Name: accessory_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accessory_cart (
    id integer NOT NULL,
    price integer NOT NULL,
    "dealId" bigint NOT NULL,
    "accessoryId" integer NOT NULL
);


ALTER TABLE public.accessory_cart OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 28968)
-- Name: accessory_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accessory_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accessory_cart_id_seq OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 217
-- Name: accessory_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accessory_cart_id_seq OWNED BY public.accessory_cart.id;


--
-- TOC entry 215 (class 1259 OID 28959)
-- Name: accessory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accessory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accessory_id_seq OWNER TO postgres;

--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 215
-- Name: accessory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accessory_id_seq OWNED BY public.accessory.id;


--
-- TOC entry 222 (class 1259 OID 28985)
-- Name: agent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agent (
    id integer NOT NULL,
    fio text NOT NULL,
    "telephoneNumber" bigint NOT NULL
);


ALTER TABLE public.agent OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 28984)
-- Name: agent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.agent_id_seq OWNER TO postgres;

--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 221
-- Name: agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agent_id_seq OWNED BY public.agent.id;


--
-- TOC entry 230 (class 1259 OID 29021)
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    id bigint NOT NULL,
    name text NOT NULL,
    country text
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 29020)
-- Name: brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.brand_id_seq OWNER TO postgres;

--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 229
-- Name: brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_id_seq OWNED BY public.brand.id;


--
-- TOC entry 224 (class 1259 OID 28994)
-- Name: car; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car (
    id bigint NOT NULL,
    status boolean NOT NULL,
    "yearOfRelease" integer NOT NULL,
    "numberOfOwners" integer NOT NULL,
    mileage integer NOT NULL,
    "engineSize" real NOT NULL,
    "enginePower" integer NOT NULL,
    color text NOT NULL,
    description text,
    vin text NOT NULL,
    "dateOfPublish" timestamp without time zone NOT NULL,
    price integer NOT NULL,
    "registrationNumber" text NOT NULL,
    "bodyNumber" text NOT NULL,
    "engineNumber" text NOT NULL,
    pts text NOT NULL,
    sts text NOT NULL,
    "imagePath" text NOT NULL,
    "driveType" integer NOT NULL,
    "transmissionType" integer NOT NULL,
    "bodyType" integer NOT NULL,
    "engineType" integer NOT NULL,
    "modelId" bigint NOT NULL
);


ALTER TABLE public.car OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 28993)
-- Name: car_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.car_id_seq OWNER TO postgres;

--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 223
-- Name: car_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.car_id_seq OWNED BY public.car.id;


--
-- TOC entry 226 (class 1259 OID 29003)
-- Name: configuration_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuration_option (
    id bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.configuration_option OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 29002)
-- Name: configuration_option_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.configuration_option_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.configuration_option_id_seq OWNER TO postgres;

--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 225
-- Name: configuration_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.configuration_option_id_seq OWNED BY public.configuration_option.id;


--
-- TOC entry 220 (class 1259 OID 28976)
-- Name: deal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deal (
    id bigint NOT NULL,
    date timestamp without time zone NOT NULL,
    "carId" bigint NOT NULL,
    "agentId" integer NOT NULL,
    "totalPrice" bigint NOT NULL,
    "customerFIO" text NOT NULL,
    "customerPassport" text NOT NULL,
    "customerDateOfBirth" text NOT NULL,
    "customerPlaceOfLiving" text NOT NULL,
    "customerTelephone" bigint NOT NULL
);


ALTER TABLE public.deal OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 28975)
-- Name: deal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deal_id_seq OWNER TO postgres;

--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 219
-- Name: deal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deal_id_seq OWNED BY public.deal.id;


--
-- TOC entry 228 (class 1259 OID 29012)
-- Name: model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model (
    id bigint NOT NULL,
    name text NOT NULL,
    "brandId" bigint NOT NULL
);


ALTER TABLE public.model OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 29011)
-- Name: model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.model_id_seq OWNER TO postgres;

--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 227
-- Name: model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.model_id_seq OWNED BY public.model.id;


--
-- TOC entry 4677 (class 2604 OID 28963)
-- Name: accessory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accessory ALTER COLUMN id SET DEFAULT nextval('public.accessory_id_seq'::regclass);


--
-- TOC entry 4678 (class 2604 OID 28972)
-- Name: accessory_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accessory_cart ALTER COLUMN id SET DEFAULT nextval('public.accessory_cart_id_seq'::regclass);


--
-- TOC entry 4680 (class 2604 OID 28988)
-- Name: agent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent ALTER COLUMN id SET DEFAULT nextval('public.agent_id_seq'::regclass);


--
-- TOC entry 4684 (class 2604 OID 29024)
-- Name: brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);


--
-- TOC entry 4681 (class 2604 OID 28997)
-- Name: car id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car ALTER COLUMN id SET DEFAULT nextval('public.car_id_seq'::regclass);


--
-- TOC entry 4682 (class 2604 OID 29006)
-- Name: configuration_option id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration_option ALTER COLUMN id SET DEFAULT nextval('public.configuration_option_id_seq'::regclass);


--
-- TOC entry 4679 (class 2604 OID 28979)
-- Name: deal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal ALTER COLUMN id SET DEFAULT nextval('public.deal_id_seq'::regclass);


--
-- TOC entry 4683 (class 2604 OID 29015)
-- Name: model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model ALTER COLUMN id SET DEFAULT nextval('public.model_id_seq'::regclass);


--
-- TOC entry 4881 (class 0 OID 29082)
-- Dependencies: 232
-- Data for Name: __MigrationHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."__MigrationHistory" VALUES ('202312241106536_InitialCreate', 'DAL.EF.DealershipDbContext', '\x1f8b0800000000000400ed5d5b6fdcb8157e2fd0ff20cc6391cdd8499aa6c678178e2f85d13836324ed03e191c8933265697a92839768bfeb23ef427f52f94d495579194662467132cb0c850e4e1e1b990e7f0f2f97ffff9efe297c728f41e608a51121fcf0e5f1ecc3c18fb4980e2cdf12ccfd63fbd9bfdf2f3ef7fb7380fa247ef4b5def35ad475ac6f878769f65dba3f91cfbf73002f86584fc34c1c93a7be927d11c04c9fcd5c1c19fe78787734848cc082dcf5b7ccae30c45b0f8417e9e26b10fb7590ec2ab248021aecac9976541d5fb082288b7c087c7b3b3930f2fcf2f66de498800e97d09c3f5cc03719c642023bc1d7dc67099a549bc596e4901086f9fb690d45b8310c38ae7a3b6ba2dfb07af28fbf3b6614dcacf7196448e040f5f57f2988bcd7b4975d6c88b48ec9c48367ba2a32ea4763c3bf17d8871923ecd3cb1b7a3d330a535895449318a5f968d5f364d5e78e587178dea8985d0ff5e78a77998e5293c8e619ea5207ce1dde4ab10f97f854fb7c9af303e8ef330641923ac916f5c0129ba49932d4cb3a74f705db17b19ccbc39df6e2e366c9a316dca715cc6d9eb5733ef23e91cac42d8e89d19f3324b52f81718c3146430b8015906d398d280c5e0a5de85bee8ffebde88a1113f997957e0f1038c37d9fdf18cfc73e65da04718d42515079f6344dc8a34cad21c2a38eceef526453e340db29bc469429c6e18892511618e6b1aef932484203653f9081ed0a610be40afb1b3539012d63ec1b0a885efd1b6f4ecd612ef84ba1769127d4a4296085fe56e99e46921b3a4bbde2d483730e3995ecc5b37b273ae922b6707a3cd7e38d93eccfd0c829063f9ed1b671a8d9acc637736f95d9b7b6dc62673afddc296612a4725aff4034f1bb37c2a3e4b3caaeaa8f8b376c792595b2fa4b5bf45e7535af2ee9cef8cb4aa7ba3ffbe4591fb82459439d8fb36845f67cf1388dc12a184e274d28399d3c2a6607a71793dfeea5f777e0330de2669361d07d41eaed7ef519add4f2886906402d7eb0fe8a1e8782a366e6108b7f749ec6a5976e110ded5a42bc6415d13b335a7d435d52b18fd7247fbe018638ae5958af9e6ba3a11f6956c90729989a65062a1fd3268f9a9c4621d05d2eadfe202b4e7e8ef0225e37b75e3cd1ff36805d35df9746584fd3c454a61145ed4cb500bb7b1355352f95b34d23d47493d736181cadf2148afd7c43a20c003139ed26eafd7d75fc990f0305a578830b419c8d079bc41315ca27fb6fb25c4974377d72c09dd245f39b7ecb5051226e9f853cb19c47e8ab6e5fedee0cebbfbfa8276d187eb008ba8b0707c7c3f3875d841f2ff096e1026d31115393f9f8f2794f749f03455dfa5c74cd5fb4d86c7ef743945a797119925c9d23141327496a207483b6dba2ef283b6d435fe49418c2384e9ea2e91953ff67006896a5bd8cbbc257a6cb1eb8247cf9d9c372cf4694912afd1262f27a0eb62e65707818a8a7724dee2d3164d1d398bd155ecb3e7a7e1b73baf12035639e3b265a150889285e28b24a4b654120bf3695076a710af43102d37fe11544f75b8d6b59db0073f95bcc2e4d0bdccb3f2185b832caaff30c16772befb9e2cb0c1eed69f829cd2908b2f77e5350bd678d9726906e53ef6d8a253fb94712217fd4631c7f7f2944a3ab69e5254ffe129cfc4538a6b0cf4f874d789747728a236612b6f12cd58e96a76869c47ec61671beb5fe28b106cda6b4e16a69d47b8cd16865a37116d00d3f089a8824ddb79015f419a8e56ccafd3846e957f01614e7e1d48dae02aa790ee5756750fbbebae0b7eaabaaf64c19622ec10ab9cebf494ae48687c2147d0bf07c4e86de50c723aae8c696010769aac924c276db1f2034811c8925693af7b68a7cd197b6aa52630be36300ce80eb19d2aee41e6dfaf80ffabad2abe824d12dbaa2244eb8c23febabbbe9fe454e455e53786ca698271f2005b45ffb1bb01ce1f9aaa6fbbab4628460f8c14ffd4c384d86d829e46d49218df8c360027218aa1ad2591fab6360443e893f5d4b735a3fba7558a02377f3e21b6e1a342b8cc6e8378a6cd777a1e079ec50137b30d56dc03ba220a405b2272b296d2b18b21d7757c46469c41efc42fafee9e02ec83400e0dc84002178e9af8b9e548b8cfc5b3f607a9471205c29486612024d922ddca467126878c28f6d1168466e1084d2de34d3af4a613f1cb19dcc298868a6641d8f45edfd79339683a12946292d162ced85ab709b267b13a452b0f6619059767ffa2cd898a55d353188cca847764278a918c601f8af1daf4dadc029bc430b4fb3e3aad9a37815a152b37144d1ab7e84a614dc5817f276917a1349bc05ad6e41de14e5ebafc44716b67142f91c630828f4863b5e9b3ba6a39897f7009b04e83ea6c9839072af763ec4d42bd59d512acb642f76216aac18c6019aa21db74db6c2c4e621ecc169f4e97aafd3e8326bb4c43750ee4320df6350b79182318853c589b4e9bb3ce69422dcd13076d98647adea388b19dc230d37b8a716378c370c788d3ba056215b3b1ef6646b0b272bb94b4c9488b263ba50b29c9c9efd1f66c45bfc147d5dddccf1856393eae3686454ba1b4973013c6862049abdb7d5ad904258b53d3a92f71eb4995d66620571dca4b54ca00c9c40b8db1953c94498da179798423352e265b5353e5450999942a523690ae77e52562d59a62685e2c9caae655b42234672c93578a745b9fa9d971a95f741abb2d9066108d4148de67b773c11012f917f746f8915b4885bbf82c4b439b8b1bb37196e9caa23b86afcabf4df2eb315afdcd0179e876d9a65bbec90c49ed6c1d223266982cf1624cc3c5d55e3052c8479d781a524f03938664730f26c19f1acac3d42755e6b48a61b79ec13a86ab4ca41812358f8387cc9ef5cb03d6a509a644c1c8a92935d8bdfd6a5ff02a263a9b48d8291656ccda4598d2350b1ac2df5d2c04f5797613a035df16f312e0a32a58cc3548208b2bb0dda278c320835425deb2840539fd69e98e9d119534e63e67776238d9f4942529d840e12b9d25037881529c9d810cac8a771ca74124555385a39a10a4ee518e386545d6d149dd86febb8a3e0aa41426249543f7aad1051957443380e246884ae5725b8f82b38010a48a1b28a749984771f91b2952007debf24e09db3e2e4aec2954af075812dbb2c89e460595c1d2f0cb227b1af5fb209608aeca642a8bb9a00a296992342d1d51f1c6e3645adaa0d3deba5453978b85a9dbefc7ca766123f579154b24d09c61e9a97099324b0a74a5d093d98b2ef8329a499186ba5b87bad97e8ca2843de0d45994384c1be5463c376da8f7e63b0ca23eeee28c417706a6a7c3e21eb0a432a6dc61642cfa01373ef6833bbd16d04045b4fdea4e99032a5011e72af4e09cc72050b2cf5771ef83011850d1673e3f9b09a2cabbfb2c24c556538f0544dd6e3f7344f1329d6dbea6050e5e293e32e75c53fcf86cb4aac9cc8c3aa53b80ee1a55b6da8f3edd82341d15e111374bec89ffe410080bafb9b99058f8664fb579d7cd928bea427b3aecd36e961464ca5da955efbb6572d50797f0bd78e6cd87ef45914b78c7bcd9e6633ce6833dbde25d364be70139b5179e588b610af369dc3058f5d29a25982abedb5367df50b354574cb9ab9da9e841ee8b830433c135b7aa4d677dfba5d81ebbb567de1f7393605bec6061ed7302cebada6287754eba43cf2d74d257378b9029ae9a52576b906941a6dc6166ad0fd5b9995577d23edd4aae3a02e8b3b22b0ee47aacf43654a6de689a4853daed7fa36ecaf34d776d68da4d2d7fed4c50df6ce22602dd75a7c9f4589dc2f4d06379d0ecae474dbbe7aac7e6419fb4dd2adfa218438ffc318671faac0eb56c66c8aaaac52ca84881e8998d1965c27003cdca00928292faea0ec3c400feb45789acf8d3eca9e999138fa664b54b27546295c6e89a932ae1446a519d0e9901eca5e3a2b2cacc23bc3fa0801e157ddc6ef03fc2b6e40ac4680d7156be1b9a1dbea5f0fb1c00fef301a39f631c848ae334e60196e654c9ee55b43c3d995f45a3e655348ab3379507763d7c767c935c4e79650fe5353347025b16f2aae4d19182cfa2bbf7a2803940bb55928406123d41d27f233a1faeb2fab4a821f14e713df1320ee0e3f1ec5f459b23eff26f7765b317de754a668623efc0fbb773cfdce1123b028bee99b60e3cb821784f6122ef766f220103a44dffdc09f1b068ebeed92c92b6b59514ad8619090fbf6d6f2065bb417d67126a77397057d1c9a0ddbda667f9406a07c41450dac39853a1620fa228015c5b28c1112bf937b218ac5bc4e25e12978e7e762f6f29a5f876e755e7484526f1a4c2ddedb58a8b87310348453cea6e2f1a5002dd5d8709e84d8803dded19983298bbbd9c2390e173453a36c8b80f48dbdc7a3597406efb2febc3e347d5d1ca80f1ad24bcda5e64a0027ab65f4ed402baf66a8f07b64722b66b3fab11615a7ba95a3e3119406c2560b10e98670693694e481cc3dbaadd3e3210e3a1c4b7bb703aee5338424f7e9f4252f8178fe5686dd355bb7dd8b4e248e03b5690cf43089a8389217347cfb8bb63135eaeacdc11372baaedc3d152eb868372fc71f63574aa1b0e433515e094f0ae68e4f7e99a8bdc363387d7eb15bae65d81dca1eef2fdf302901a8619656577bb44891a43d5d626a5bd063f291494f2b4b5fb11ad2b0ad49e6612cd6a65606e7f182a76978a766e7f76e7efaeabf4a426a93a60e75f399b11b9be0f93b354f47426a6bded30867dd900bd0dc1761b733d1b49d5d6abd9948ab5876d1b06d45641adc8e02bfb83661b43c7ba1b967247dafb88cf0a7e6d18e49ac51cb04b90b551e66bcbb9427bc1fb7943a9ed10356d9224b40bd2e01964a29d6fb747833f93612944656a00c9ba61cdcadb8ac7b36d01664e545f6ebd80b68664341dc06766dc33537f7447c80e1e4d8b8ea6e922b0864ed323a7e9b8b7c555d3c1aa69e8fafd20d76c11d774bdb275abcd41231bd53223755c956bba8aecb1dbf4d06d1ada2b25b09b85f8347ad254d4f44eed1857c293c175c685979350af14d398762d60df667742184e891c2783c5750ed14a283b04876b109dec31e23497fe4d1b5186d7585d42e9f684aea70d7b145c8d5be52038f56b0431c0151ea83f5bc1ec003fcf69b0fb728d5d82e4c9b0789d43e29626e669dcf041ed0a06cfcc9cab4e9f2dd49d7a411979417240b093df0191c83e8fe945b1f2d719c468d39258109a31f4b998bea97319af933abf1038aaab88ef9061060212f09fa4195a033f239fe9908b2bc1d59fe9398f5630b88caff36c9b6764c8305a859c40698ad2d57f01d3c7f3bca8de12ef6208844d545cb68bdfe7286cffbcd085e274574382e63ed58d03aa4b7a490e6e9e1a4a1f25d01c1da14a7c4dca760ba36d4888e1eb78091e601fde3e63f8016e80ff54bfeed213312b8217fbe20c814d0a225cd168db939fc48683e8f1e7ff03ea2f9974f5950000', '6.4.4');


--
-- TOC entry 4880 (class 0 OID 29029)
-- Dependencies: 231
-- Data for Name: _cars_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._cars_options VALUES (4, 1);
INSERT INTO public._cars_options VALUES (2, 3);
INSERT INTO public._cars_options VALUES (5, 3);
INSERT INTO public._cars_options VALUES (7, 3);
INSERT INTO public._cars_options VALUES (8, 3);
INSERT INTO public._cars_options VALUES (10, 3);
INSERT INTO public._cars_options VALUES (12, 3);
INSERT INTO public._cars_options VALUES (13, 3);
INSERT INTO public._cars_options VALUES (14, 3);
INSERT INTO public._cars_options VALUES (1, 4);
INSERT INTO public._cars_options VALUES (5, 4);
INSERT INTO public._cars_options VALUES (7, 4);
INSERT INTO public._cars_options VALUES (10, 4);
INSERT INTO public._cars_options VALUES (7, 2);
INSERT INTO public._cars_options VALUES (1, 5);
INSERT INTO public._cars_options VALUES (4, 5);
INSERT INTO public._cars_options VALUES (5, 5);
INSERT INTO public._cars_options VALUES (7, 5);
INSERT INTO public._cars_options VALUES (8, 5);
INSERT INTO public._cars_options VALUES (10, 5);
INSERT INTO public._cars_options VALUES (1, 6);
INSERT INTO public._cars_options VALUES (3, 6);
INSERT INTO public._cars_options VALUES (4, 6);
INSERT INTO public._cars_options VALUES (7, 6);
INSERT INTO public._cars_options VALUES (8, 6);
INSERT INTO public._cars_options VALUES (10, 6);
INSERT INTO public._cars_options VALUES (13, 6);
INSERT INTO public._cars_options VALUES (15, 6);
INSERT INTO public._cars_options VALUES (1, 7);
INSERT INTO public._cars_options VALUES (7, 7);
INSERT INTO public._cars_options VALUES (15, 7);
INSERT INTO public._cars_options VALUES (2, 2);
INSERT INTO public._cars_options VALUES (10, 2);
INSERT INTO public._cars_options VALUES (13, 2);
INSERT INTO public._cars_options VALUES (5, 8);
INSERT INTO public._cars_options VALUES (6, 8);
INSERT INTO public._cars_options VALUES (7, 8);
INSERT INTO public._cars_options VALUES (8, 8);
INSERT INTO public._cars_options VALUES (12, 8);
INSERT INTO public._cars_options VALUES (13, 8);
INSERT INTO public._cars_options VALUES (15, 8);
INSERT INTO public._cars_options VALUES (1, 9);
INSERT INTO public._cars_options VALUES (4, 9);
INSERT INTO public._cars_options VALUES (1, 10);
INSERT INTO public._cars_options VALUES (3, 10);
INSERT INTO public._cars_options VALUES (7, 10);
INSERT INTO public._cars_options VALUES (15, 10);
INSERT INTO public._cars_options VALUES (1, 11);
INSERT INTO public._cars_options VALUES (2, 12);
INSERT INTO public._cars_options VALUES (4, 12);
INSERT INTO public._cars_options VALUES (7, 12);
INSERT INTO public._cars_options VALUES (8, 12);
INSERT INTO public._cars_options VALUES (10, 12);
INSERT INTO public._cars_options VALUES (15, 12);
INSERT INTO public._cars_options VALUES (1, 13);
INSERT INTO public._cars_options VALUES (7, 13);
INSERT INTO public._cars_options VALUES (10, 13);
INSERT INTO public._cars_options VALUES (2, 14);
INSERT INTO public._cars_options VALUES (4, 14);
INSERT INTO public._cars_options VALUES (7, 14);
INSERT INTO public._cars_options VALUES (10, 14);
INSERT INTO public._cars_options VALUES (15, 14);
INSERT INTO public._cars_options VALUES (1, 15);
INSERT INTO public._cars_options VALUES (7, 15);
INSERT INTO public._cars_options VALUES (10, 15);
INSERT INTO public._cars_options VALUES (3, 16);
INSERT INTO public._cars_options VALUES (5, 16);
INSERT INTO public._cars_options VALUES (7, 16);
INSERT INTO public._cars_options VALUES (8, 16);
INSERT INTO public._cars_options VALUES (10, 16);
INSERT INTO public._cars_options VALUES (14, 16);
INSERT INTO public._cars_options VALUES (3, 3);
INSERT INTO public._cars_options VALUES (11, 3);
INSERT INTO public._cars_options VALUES (8, 2);


--
-- TOC entry 4865 (class 0 OID 28960)
-- Dependencies: 216
-- Data for Name: accessory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.accessory VALUES (5, 'Набор для детейлинга салона авто', 2385, 0, true);
INSERT INTO public.accessory VALUES (4, 'Набор инструмента "Inforce"', 5000, 5, true);
INSERT INTO public.accessory VALUES (6, 'Видеорегистратор "70mai" ', 6000, 8, true);
INSERT INTO public.accessory VALUES (3, 'Набор начинающего водителя ', 3000, 0, true);
INSERT INTO public.accessory VALUES (1, 'Освежитель воздуха "Лесная Свежесть"', 150, 3, true);
INSERT INTO public.accessory VALUES (2, 'Набор EVO ковриков', 2500, 2, true);
INSERT INTO public.accessory VALUES (7, 'Держатель для телефона', 1050, 3, true);
INSERT INTO public.accessory VALUES (9, 'Освежитель', 300, 1, false);
INSERT INTO public.accessory VALUES (8, 'Авто зарядка type-c', 600, 3, true);


--
-- TOC entry 4867 (class 0 OID 28969)
-- Dependencies: 218
-- Data for Name: accessory_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.accessory_cart VALUES (1, 1050, 1, 7);
INSERT INTO public.accessory_cart VALUES (2, 6000, 2, 6);
INSERT INTO public.accessory_cart VALUES (3, 3000, 2, 3);
INSERT INTO public.accessory_cart VALUES (4, 150, 2, 1);
INSERT INTO public.accessory_cart VALUES (5, 600, 3, 8);
INSERT INTO public.accessory_cart VALUES (6, 6000, 3, 6);
INSERT INTO public.accessory_cart VALUES (7, 2500, 3, 2);
INSERT INTO public.accessory_cart VALUES (8, 5000, 3, 4);
INSERT INTO public.accessory_cart VALUES (9, 3000, 4, 3);
INSERT INTO public.accessory_cart VALUES (10, 150, 4, 1);
INSERT INTO public.accessory_cart VALUES (11, 1050, 5, 7);
INSERT INTO public.accessory_cart VALUES (12, 2500, 5, 2);
INSERT INTO public.accessory_cart VALUES (13, 150, 5, 1);


--
-- TOC entry 4871 (class 0 OID 28985)
-- Dependencies: 222
-- Data for Name: agent; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.agent VALUES (1, 'Иван Петович Крупин', 79208690855);


--
-- TOC entry 4879 (class 0 OID 29021)
-- Dependencies: 230
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.brand VALUES (1, 'BMW', NULL);
INSERT INTO public.brand VALUES (9, 'LADA', NULL);
INSERT INTO public.brand VALUES (2, 'Audi', NULL);
INSERT INTO public.brand VALUES (4, 'Skoda', NULL);
INSERT INTO public.brand VALUES (6, 'Toyota', NULL);
INSERT INTO public.brand VALUES (7, 'Nissan', NULL);
INSERT INTO public.brand VALUES (8, 'Subaru', NULL);
INSERT INTO public.brand VALUES (10, 'Changan', NULL);
INSERT INTO public.brand VALUES (11, 'Chery', NULL);
INSERT INTO public.brand VALUES (12, 'Chevrolet', NULL);
INSERT INTO public.brand VALUES (13, 'Geely', NULL);
INSERT INTO public.brand VALUES (14, 'Daewoo', NULL);
INSERT INTO public.brand VALUES (15, 'Ford', NULL);
INSERT INTO public.brand VALUES (24, 'Haval', NULL);
INSERT INTO public.brand VALUES (25, 'Honda', NULL);
INSERT INTO public.brand VALUES (26, 'Kia', NULL);
INSERT INTO public.brand VALUES (27, 'Lexus', NULL);
INSERT INTO public.brand VALUES (28, 'Land Rover', NULL);
INSERT INTO public.brand VALUES (29, 'Suzuki', NULL);
INSERT INTO public.brand VALUES (30, 'Volvo', NULL);
INSERT INTO public.brand VALUES (31, 'Opel', NULL);
INSERT INTO public.brand VALUES (32, 'Renault', NULL);
INSERT INTO public.brand VALUES (33, 'Mazda', NULL);
INSERT INTO public.brand VALUES (3, 'Mercedes-Benz', NULL);
INSERT INTO public.brand VALUES (34, 'Mitsubishi', NULL);
INSERT INTO public.brand VALUES (35, 'Peugeot', NULL);
INSERT INTO public.brand VALUES (36, 'Volkswagen', NULL);
INSERT INTO public.brand VALUES (37, 'ГАЗ', NULL);
INSERT INTO public.brand VALUES (38, 'УАЗ', NULL);
INSERT INTO public.brand VALUES (39, 'Aston Martin', NULL);
INSERT INTO public.brand VALUES (40, 'Acura', NULL);
INSERT INTO public.brand VALUES (41, 'Bentley', NULL);
INSERT INTO public.brand VALUES (43, 'Citroen', NULL);
INSERT INTO public.brand VALUES (44, 'Datsun', NULL);
INSERT INTO public.brand VALUES (45, 'Dodge', NULL);
INSERT INTO public.brand VALUES (46, 'EXEED', NULL);
INSERT INTO public.brand VALUES (47, 'FIAT', NULL);
INSERT INTO public.brand VALUES (49, 'JAC', NULL);
INSERT INTO public.brand VALUES (50, 'Jeep', NULL);
INSERT INTO public.brand VALUES (51, 'Jaguar', NULL);
INSERT INTO public.brand VALUES (54, 'Lifan', NULL);
INSERT INTO public.brand VALUES (56, 'Porsche', NULL);
INSERT INTO public.brand VALUES (58, 'Tank', NULL);
INSERT INTO public.brand VALUES (59, 'Tesla', NULL);
INSERT INTO public.brand VALUES (60, 'Москвич', NULL);
INSERT INTO public.brand VALUES (61, 'ЛуАЗ', NULL);
INSERT INTO public.brand VALUES (62, 'ИЖ', NULL);
INSERT INTO public.brand VALUES (63, 'ЗАЗ', NULL);
INSERT INTO public.brand VALUES (5, 'Hyundai', NULL);
INSERT INTO public.brand VALUES (48, 'Infiniti', NULL);
INSERT INTO public.brand VALUES (64, 'Ferrari', NULL);
INSERT INTO public.brand VALUES (65, 'Lamborghini', NULL);
INSERT INTO public.brand VALUES (66, 'Rolls-Royce', NULL);
INSERT INTO public.brand VALUES (67, 'Cadillac', NULL);
INSERT INTO public.brand VALUES (68, 'Zeekr', NULL);


--
-- TOC entry 4873 (class 0 OID 28994)
-- Dependencies: 224
-- Data for Name: car; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.car VALUES (4, false, 2013, 3, 142000, 1.4, 120, 'серый', 'Данный автoмoбиль пpoшeл юpидическую провeрку, a такжe кoмплeкcную диaгнoстику. Пpи пoкупкe Bы пoлучaете лист c заключением о coстоянии aвтoмобиля.', 'WBAPA7104E1234567', '2023-12-25 02:20:35.602725', 1150000, 'К907ПК37', 'C3GTE25064114', 'H8HGCM8265313', '11 ЗС 126789 выдан 20.09.2018 ГИБДД г.Иваново', '91 ЗС 126789 выдан 20.09.2018 ГИБДД г.Иваново', 'Images\CarsForSale\4', 0, 1, 2, 0, 1657);
INSERT INTO public.car VALUES (3, false, 2020, 1, 76500, 1.5, 143, 'коричневый', 'Наvаl H6 с пробегом прошел кoмплекcную диагноcтику, пpедпрoдажную пoдгoтoвку и юpидичecкую провеpку.', 'JT4RN86S0B1234567', '2022-11-10 01:57:11.943924', 2100000, 'Е112НО37', '1HGCM826531', 'U21M13D4D7CD5', '13 КС 754086 выдан 28.01.2021 ГИБДД г.Иваново', '33 КС 754086 выдан 28.01.2021 ГИБДД г.Иваново', 'Images\CarsForSale\3', 2, 2, 5, 0, 808);
INSERT INTO public.car VALUES (1, false, 1980, 2, 60000, 1.3, 69, 'бежевый', 'Продаётся автомобиль в коллекционном состоянии.', 'XTA210113459876', '2023-06-01 14:06:54.205701', 200000, 'В088УЕ33', '3459876', '21011-8946', '29 ДР 576495 выдан 20.10.2018 ГИБДД г.Владимир', '19 ДР 576495 выдан 20.10.2018 ГИБДД г.Владимир', 'Images\CarsForSale\1', 1, 0, 0, 0, 1130);
INSERT INTO public.car VALUES (2, true, 2011, 5, 155000, 2, 136, 'синий', 'Продаётся автомобиль в отличном состоянии, прошёл все проверки.', 'KRG89911345987664', '2023-11-16 14:06:54.205701', 1170000, 'Е779КН37', 'K11FTRX1875406', 'I9FTRX1875404', '64 ТК 946287 выдан 17.11.2019 ГИБДД г.Иваново', '74 ТК 946287 выдан 17.11.2019 ГИБДД г.Иваново', 'Images\CarsForSale\2', 1, 1, 0, 0, 153);
INSERT INTO public.car VALUES (5, false, 2011, 3, 231000, 1.2, 150, 'черный', 'Автомобиль прошел кoмплекcную диагноcтику, пpедпрoдажную пoдгoтoвку и юpидичecкую провеpку.', '3C3CFFBR3HT123456', '2023-06-01 09:47:14.709256', 900000, 'А019ОР37', '9FTRX1875401', '2FTRX187540', '85 ЛМ 194754 выдан 21.03.2015 ГИБДД г.Иваново', '25 ЛМ 194754 выдан 21.03.2015 ГИБДД г.Иваново', 'Images\CarsForSale\5', 0, 1, 1, 0, 73);
INSERT INTO public.car VALUES (13, false, 2009, 3, 177000, 1.6, 122, 'синий', 'Автомобиль прошел кoмплекcную диагноcтику, пpедпрoдажную пoдгoтoвку и юpидичecкую провеpку.', 'JA32U8FW2BU123456', '2023-12-10 11:12:47.873165', 680000, 'Н675РП37', 'G7F1234567898', 'F6G7GM5285307', '25 УЕ 765483 выдан 21.03.2020 ГИБДД г.Иваново', '15 УЕ 765483 выдан 21.03.2020 ГИБДД г.Иваново', 'Images\CarsForSale\13', 0, 0, 1, 0, 941);
INSERT INTO public.car VALUES (16, true, 2011, 2, 128000, 2, 150, 'синий', 'Автомобиль прошел кoмплекcную диагноcтику, пpедпрoдажную пoдгoтoвку и юpидичecкую провеpку.', 'UTRBRBLC8E1234567', '2023-12-25 12:56:41.757494', 860000, 'Н926РО37', 'T20L12GTE250641', 'S19K11FTRX1875', '78 ДР 850933 выдан 20.10.2018 ГИБДД г.Иваново', '96 ДР 850933 выдан 20.10.2018 ГИБДД г.Иваново', 'Images\CarsForSale\16', 2, 0, 5, 0, 950);
INSERT INTO public.car VALUES (6, true, 2014, 2, 142000, 3.3, 270, 'серебристый', 'Ha автомобилe проведенa пoлная прeдпpодажнaя подгoтoвка.Лакoкpасoчное пoкрытие без повреждений.Kоpoбкa и двигaтель работают без нaрeканий .', 'KMHDN46D43U123456', '2023-12-01 09:54:52.915676', 1500000, 'У086КХ37', 'J10A1HGCM8265315', '3GTE2506411', '27 ПК 593659 выдан 20.07.2018 ГИБДД г.Иваново', '17 ПК 593659 выдан 20.07.2018 ГИБДД г.Иваново', 'Images\CarsForSale\6', 2, 0, 5, 0, 965);
INSERT INTO public.car VALUES (8, true, 2016, 3, 93000, 2.1, 170, 'коричневый', 'Автомобиль прошел кoмплекcную диагноcтику, пpедпрoдажную пoдгoтoвку и юpидичecкую провеpку.', '2HGFA16528H123456', '2023-12-06 10:35:27.161227', 3050000, 'Н709РН37', 'A1HGCM82653', '5FNRL3815BD', '26 ОР 297597 выдан 20.08.2018 ГИБДД г.Иваново', '06 ОР 297597 выдан 20.08.2018 ГИБДД г.Иваново', 'Images\CarsForSale\8', 2, 1, 5, 0, 1365);
INSERT INTO public.car VALUES (9, true, 2016, 1, 120000, 1.6, 87, 'серебристый', 'Автомобиль прошел кoмплекcную диагноcтику, пpедпрoдажную пoдгoтoвку и юpидичecкую провеpку.', 'KL1SF48C4MB123456', '2023-11-01 10:39:24.164263', 430000, 'О156КМ37', 'B2FTRX1875403', '6G7GM528530', '97 РМ 709465 выдан 21.01.2019 ГИБДД г.Иваново', '17 РМ 709465 выдан 21.01.2019 ГИБДД г.Иваново', 'Images\CarsForSale\9', 0, 0, 1, 0, 1155);
INSERT INTO public.car VALUES (10, true, 2021, 1, 34000, 1.6, 106, 'серебристый', 'Автомобиль прошел кoмплекcную диагноcтику, пpедпрoдажную пoдгoтoвку и юpидичecкую провеpку.', '1FTEX1EP6CFB12345', '2023-11-18 10:43:53.44872', 1150000, 'Д090РМ37', 'R18J10A1HGCM8265', 'D4D7CD563990', '97 НЕ 302755 выдан 07.09.2021 ГИБДД г.Иваново', '87 НЕ 302755 выдан 07.09.2021 ГИБДД г.Иваново', 'Images\CarsForSale\10', 0, 0, 0, 0, 1161);
INSERT INTO public.car VALUES (11, true, 2015, 2, 110000, 2.7, 128, 'серебристый', 'Автомобиль прошел кoмплекcную диагноcтику, пpедпрoдажную пoдгoтoвку и юpидичecкую провеpку.', 'WDBEA30D0MB123456', '2023-12-05 10:50:59.568212', 600000, 'У765ГО37', 'N14E5FNRL3815', '7F123456789', '12 ПР 285786 выдан 21.08.2019 ГИБДД г.Иваново', '02 ПР 285786 выдан 21.08.2019 ГИБДД г.Иваново', 'Images\CarsForSale\11', 2, 0, 6, 0, 2367);
INSERT INTO public.car VALUES (12, true, 2011, 5, 126000, 2, 240, 'серебристый', 'Автомобиль прошел кoмплекcную диагноcтику, пpедпрoдажную пoдгoтoвку и юpидичecкую провеpку.', '1J4GA59198L123456', '2023-11-09 11:06:45.043769', 980000, 'П809ПА37', 'E5FNRL3815BD6', '8HGCM8265310', '28 ХМ 385937 выдан 23.01.2018 ГИБДД г.Иваново', '98 ХМ 385937 выдан 23.01.2018 ГИБДД г.Иваново', 'Images\CarsForSale\12', 0, 1, 0, 0, 713);
INSERT INTO public.car VALUES (14, true, 2007, 3, 131000, 1.6, 109, 'серебристый', 'Автомобиль прошел кoмплекcную диагноcтику, пpедпрoдажную пoдгoтoвку и юpидичecкую провеpку.', 'SCFAE12345K123456', '2023-12-19 11:18:55.055948', 590000, 'Г900УР37', 'O15F6G7GM5285308', 'L12GTE25064116', '39 УЕ 586948 выдан 25.04.2019 ГИБДД г.Иваново', '99 УЕ 586948 выдан 25.04.2019 ГИБДД г.Иваново', 'Images\CarsForSale\14', 0, 1, 1, 0, 429);
INSERT INTO public.car VALUES (15, true, 2016, 1, 135000, 1.6, 82, 'белый', 'Автомобиль прошел кoмплекcную диагноcтику, пpедпрoдажную пoдгoтoвку и юpидичecкую провеpку.', 'YV1LS5545W1234567', '2023-12-15 11:26:41.522772', 740000, 'К806МИ37', 'Q17I9FTRX187540', 'P16G7HGCM8', '29 ДР 576495 выдан 20.10.2018 ГИБДД г.Иваново', '19 ДР 576495 выдан 20.10.2018 ГИБДД г.Иваново', 'Images\CarsForSale\15', 0, 0, 0, 0, 1801);
INSERT INTO public.car VALUES (7, true, 2012, 3, 144000, 3.7, 277, 'серый', 'Ha автомобилe проведенa пoлная прeдпpодажнaя подгoтoвка.', 'JHMCG7657BC123456', '2023-10-20 10:00:36.947596', 1725000, 'Р877КС37', 'JHMCG7657BC123456', '4D7CD563990', '12 РО 986436 выдан 01.06.2015 ГИБДД г.Иваново', '02 РО 986436 выдан 01.06.2015 ГИБДД г.Иваново', 'Images\CarsForSale\7', 2, 1, 5, 0, 1273);


--
-- TOC entry 4875 (class 0 OID 29003)
-- Dependencies: 226
-- Data for Name: configuration_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.configuration_option VALUES (1, 'Кондиционер');
INSERT INTO public.configuration_option VALUES (2, 'Климат-контроль');
INSERT INTO public.configuration_option VALUES (3, 'Навигационная система');
INSERT INTO public.configuration_option VALUES (4, 'Акустическая подготовка');
INSERT INTO public.configuration_option VALUES (5, 'ЭУР');
INSERT INTO public.configuration_option VALUES (6, 'ГУР');
INSERT INTO public.configuration_option VALUES (7, 'ABS');
INSERT INTO public.configuration_option VALUES (8, 'ESP');
INSERT INTO public.configuration_option VALUES (10, 'Электростеклоподъёмники');
INSERT INTO public.configuration_option VALUES (11, 'Подогрев сидений');
INSERT INTO public.configuration_option VALUES (12, 'Контроль слепых зон');
INSERT INTO public.configuration_option VALUES (13, 'Камера 360');
INSERT INTO public.configuration_option VALUES (14, 'Помощь при парковке');
INSERT INTO public.configuration_option VALUES (15, 'Парктроники');


--
-- TOC entry 4869 (class 0 OID 28976)
-- Dependencies: 220
-- Data for Name: deal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.deal VALUES (4, '2023-12-25 19:45:56.629051', 4, 1, 1153150, 'Кулагин Андрей Юрьевич', '12 34 573354 выдан 21.01.2008 УМВД г.Иваново', '06.02.1995', 'г.Иваново, ул.Парижской Комуны. д.15, кв.18', 79209008544);
INSERT INTO public.deal VALUES (3, '2022-12-16 19:37:07.614646', 3, 1, 2114100, 'Петров Аркадий Сергеевич', '12 35 657896 выдан 24.01.2002 УМВД г.Шуя', '14.09.1975', 'г.Иваново, ул.Ленина, д.7, кв.18', 79108666488);
INSERT INTO public.deal VALUES (2, '2023-12-17 19:25:34.871348', 13, 1, 689150, 'Никонов Петр Александрович', '25 67 678643 выдан 12.04.2006 УМВД г.Иваново', '04.06.1981', 'г.Иваново, ул.10 августа, д.7, кв.15', 79207665833);
INSERT INTO public.deal VALUES (1, '2023-07-11 02:31:19.0516', 1, 1, 201050, 'Кандрушин Павел Алексеевич', '17 17 676543 выдан 24.07.2019 УМВД г.Владимира', '21.03.2003', 'г.Владимир, ул.Перекопский в/г, д.16, кв.18', 79209000755);
INSERT INTO public.deal VALUES (5, '2023-06-13 21:03:41.807203', 5, 1, 903700, 'Прутов Владимир Анатольевич', '12 23 567984 выдан 26.08.2012 УМВД г.Иваново', '16.04.1992', 'г.Иваново, ул.Ленина, д.5, кв.20', 79997563355);


--
-- TOC entry 4877 (class 0 OID 29012)
-- Dependencies: 228
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.model VALUES (27, 'CL', 40);
INSERT INTO public.model VALUES (28, 'CSX', 40);
INSERT INTO public.model VALUES (29, 'EL', 40);
INSERT INTO public.model VALUES (30, 'ILX', 40);
INSERT INTO public.model VALUES (31, 'Integra', 40);
INSERT INTO public.model VALUES (32, 'Legend', 40);
INSERT INTO public.model VALUES (33, 'MDX', 40);
INSERT INTO public.model VALUES (34, 'NSX', 40);
INSERT INTO public.model VALUES (35, 'RDX', 40);
INSERT INTO public.model VALUES (36, 'RL', 40);
INSERT INTO public.model VALUES (37, 'RLX', 40);
INSERT INTO public.model VALUES (38, 'RSX', 40);
INSERT INTO public.model VALUES (39, 'SLX', 40);
INSERT INTO public.model VALUES (40, 'TL', 40);
INSERT INTO public.model VALUES (41, 'TLX', 40);
INSERT INTO public.model VALUES (42, 'TSX', 40);
INSERT INTO public.model VALUES (43, 'ZDX', 40);
INSERT INTO public.model VALUES (44, 'Bulldog', 39);
INSERT INTO public.model VALUES (45, 'Cygnet', 39);
INSERT INTO public.model VALUES (46, 'DB AR1', 39);
INSERT INTO public.model VALUES (47, 'DB11', 39);
INSERT INTO public.model VALUES (48, 'DB12', 39);
INSERT INTO public.model VALUES (49, 'DB5', 39);
INSERT INTO public.model VALUES (50, 'DB7', 39);
INSERT INTO public.model VALUES (51, 'DB9', 39);
INSERT INTO public.model VALUES (52, 'DBS', 39);
INSERT INTO public.model VALUES (53, 'DBX', 39);
INSERT INTO public.model VALUES (54, 'Lagonda', 39);
INSERT INTO public.model VALUES (55, 'One-77', 39);
INSERT INTO public.model VALUES (56, 'Rapide', 39);
INSERT INTO public.model VALUES (57, 'Tickford Capri', 39);
INSERT INTO public.model VALUES (58, 'V12 Vantage', 39);
INSERT INTO public.model VALUES (59, 'V12 Zagato', 39);
INSERT INTO public.model VALUES (60, 'V8 Vantage', 39);
INSERT INTO public.model VALUES (61, 'V8 Zagato', 39);
INSERT INTO public.model VALUES (62, 'Vanquish', 39);
INSERT INTO public.model VALUES (63, 'Virage', 39);
INSERT INTO public.model VALUES (64, 'Vulcan', 39);
INSERT INTO public.model VALUES (65, '100', 2);
INSERT INTO public.model VALUES (66, '200', 2);
INSERT INTO public.model VALUES (67, '50', 2);
INSERT INTO public.model VALUES (68, '80', 2);
INSERT INTO public.model VALUES (69, '90', 2);
INSERT INTO public.model VALUES (70, '920', 2);
INSERT INTO public.model VALUES (71, 'A1', 2);
INSERT INTO public.model VALUES (72, 'A2', 2);
INSERT INTO public.model VALUES (73, 'A3', 2);
INSERT INTO public.model VALUES (74, 'A4', 2);
INSERT INTO public.model VALUES (75, 'A4 allroad', 2);
INSERT INTO public.model VALUES (76, 'A5', 2);
INSERT INTO public.model VALUES (77, 'A6', 2);
INSERT INTO public.model VALUES (78, 'A6 allroad', 2);
INSERT INTO public.model VALUES (79, 'A7', 2);
INSERT INTO public.model VALUES (80, 'A8', 2);
INSERT INTO public.model VALUES (81, 'Cabriolet', 2);
INSERT INTO public.model VALUES (82, 'Coupe', 2);
INSERT INTO public.model VALUES (83, 'e-tron', 2);
INSERT INTO public.model VALUES (84, 'e-tron GT', 2);
INSERT INTO public.model VALUES (85, 'e-tron S', 2);
INSERT INTO public.model VALUES (86, 'e-tron S Sportback', 2);
INSERT INTO public.model VALUES (87, 'e-tron Sportback', 2);
INSERT INTO public.model VALUES (88, 'Front', 2);
INSERT INTO public.model VALUES (89, 'NSU RO 80', 2);
INSERT INTO public.model VALUES (90, 'Q2', 2);
INSERT INTO public.model VALUES (91, 'Q3', 2);
INSERT INTO public.model VALUES (92, 'Q3 Sportback', 2);
INSERT INTO public.model VALUES (93, 'Q4 e-tron', 2);
INSERT INTO public.model VALUES (94, 'Q4 Sportback e-tron', 2);
INSERT INTO public.model VALUES (95, 'Q5', 2);
INSERT INTO public.model VALUES (96, 'Q5 e-tron', 2);
INSERT INTO public.model VALUES (97, 'Q5 Sportback', 2);
INSERT INTO public.model VALUES (98, 'Q6', 2);
INSERT INTO public.model VALUES (99, 'Q7', 2);
INSERT INTO public.model VALUES (100, 'Q8', 2);
INSERT INTO public.model VALUES (101, 'Q8 e-tron', 2);
INSERT INTO public.model VALUES (102, 'Q8 Sportback e-tron', 2);
INSERT INTO public.model VALUES (103, 'Quattro', 2);
INSERT INTO public.model VALUES (104, 'R8', 2);
INSERT INTO public.model VALUES (105, 'R8 LMP', 2);
INSERT INTO public.model VALUES (106, 'RS 2', 2);
INSERT INTO public.model VALUES (107, 'RS 3', 2);
INSERT INTO public.model VALUES (108, 'RS 4', 2);
INSERT INTO public.model VALUES (109, 'RS 5', 2);
INSERT INTO public.model VALUES (110, 'RS 6', 2);
INSERT INTO public.model VALUES (111, 'RS 7', 2);
INSERT INTO public.model VALUES (112, 'RS e-tron GT', 2);
INSERT INTO public.model VALUES (113, 'RS Q3', 2);
INSERT INTO public.model VALUES (114, 'RS Q3 Sportback', 2);
INSERT INTO public.model VALUES (115, 'RS Q8', 2);
INSERT INTO public.model VALUES (116, 'S1', 2);
INSERT INTO public.model VALUES (117, 'S2', 2);
INSERT INTO public.model VALUES (118, 'S3', 2);
INSERT INTO public.model VALUES (119, 'S4', 2);
INSERT INTO public.model VALUES (120, 'S5', 2);
INSERT INTO public.model VALUES (121, 'S6', 2);
INSERT INTO public.model VALUES (122, 'S7', 2);
INSERT INTO public.model VALUES (123, 'S8', 2);
INSERT INTO public.model VALUES (124, 'SQ2', 2);
INSERT INTO public.model VALUES (125, 'SQ5', 2);
INSERT INTO public.model VALUES (126, 'SQ5 Sportback', 2);
INSERT INTO public.model VALUES (127, 'SQ7', 2);
INSERT INTO public.model VALUES (128, 'SQ8', 2);
INSERT INTO public.model VALUES (129, 'SQ8 e-tron', 2);
INSERT INTO public.model VALUES (130, 'SQ8 Sportback e-tron', 2);
INSERT INTO public.model VALUES (131, 'TT', 2);
INSERT INTO public.model VALUES (132, 'TT RS', 2);
INSERT INTO public.model VALUES (133, 'TTS', 2);
INSERT INTO public.model VALUES (134, 'Typ R', 2);
INSERT INTO public.model VALUES (135, 'V8', 2);
INSERT INTO public.model VALUES (136, 'Arnage', 41);
INSERT INTO public.model VALUES (137, 'Azure', 41);
INSERT INTO public.model VALUES (138, 'Bentayga', 41);
INSERT INTO public.model VALUES (139, 'Brooklands', 41);
INSERT INTO public.model VALUES (140, 'Continental', 41);
INSERT INTO public.model VALUES (141, 'Continental Flying Spur', 41);
INSERT INTO public.model VALUES (142, 'Continental GT', 41);
INSERT INTO public.model VALUES (143, 'Eight', 41);
INSERT INTO public.model VALUES (144, 'Flying Spur', 41);
INSERT INTO public.model VALUES (145, 'Mark VI', 41);
INSERT INTO public.model VALUES (146, 'Mulsanne', 41);
INSERT INTO public.model VALUES (147, 'R Type', 41);
INSERT INTO public.model VALUES (148, 'S', 41);
INSERT INTO public.model VALUES (149, 'T-Series', 41);
INSERT INTO public.model VALUES (150, 'Turbo R', 41);
INSERT INTO public.model VALUES (151, '1-series', 1);
INSERT INTO public.model VALUES (152, '2-series', 1);
INSERT INTO public.model VALUES (153, '3-series', 1);
INSERT INTO public.model VALUES (154, '4-series', 1);
INSERT INTO public.model VALUES (155, '5-series', 1);
INSERT INTO public.model VALUES (156, '6-series', 1);
INSERT INTO public.model VALUES (157, '7-series', 1);
INSERT INTO public.model VALUES (158, '8-series', 1);
INSERT INTO public.model VALUES (159, 'E3', 1);
INSERT INTO public.model VALUES (160, 'E9', 1);
INSERT INTO public.model VALUES (161, 'i3', 1);
INSERT INTO public.model VALUES (162, 'i4', 1);
INSERT INTO public.model VALUES (163, 'i5', 1);
INSERT INTO public.model VALUES (164, 'i7', 1);
INSERT INTO public.model VALUES (165, 'i8', 1);
INSERT INTO public.model VALUES (166, 'iX', 1);
INSERT INTO public.model VALUES (167, 'iX1', 1);
INSERT INTO public.model VALUES (168, 'iX2', 1);
INSERT INTO public.model VALUES (169, 'iX3', 1);
INSERT INTO public.model VALUES (170, 'M1', 1);
INSERT INTO public.model VALUES (171, 'M2', 1);
INSERT INTO public.model VALUES (172, 'M3', 1);
INSERT INTO public.model VALUES (173, 'M4', 1);
INSERT INTO public.model VALUES (174, 'M5', 1);
INSERT INTO public.model VALUES (175, 'M6', 1);
INSERT INTO public.model VALUES (176, 'M8', 1);
INSERT INTO public.model VALUES (177, 'X1', 1);
INSERT INTO public.model VALUES (178, 'X2', 1);
INSERT INTO public.model VALUES (179, 'X3', 1);
INSERT INTO public.model VALUES (180, 'X3 M', 1);
INSERT INTO public.model VALUES (181, 'X4', 1);
INSERT INTO public.model VALUES (182, 'X4 M', 1);
INSERT INTO public.model VALUES (183, 'X5', 1);
INSERT INTO public.model VALUES (184, 'X5 M', 1);
INSERT INTO public.model VALUES (185, 'X6', 1);
INSERT INTO public.model VALUES (186, 'X6 M', 1);
INSERT INTO public.model VALUES (187, 'X7', 1);
INSERT INTO public.model VALUES (188, 'XM', 1);
INSERT INTO public.model VALUES (189, 'Z1', 1);
INSERT INTO public.model VALUES (190, 'Z3', 1);
INSERT INTO public.model VALUES (191, 'Z3 M', 1);
INSERT INTO public.model VALUES (192, 'Z4', 1);
INSERT INTO public.model VALUES (193, 'Z4 M', 1);
INSERT INTO public.model VALUES (194, 'Z8', 1);
INSERT INTO public.model VALUES (195, 'Allante', 67);
INSERT INTO public.model VALUES (196, 'ATS', 67);
INSERT INTO public.model VALUES (197, 'ATS-V', 67);
INSERT INTO public.model VALUES (198, 'BLS', 67);
INSERT INTO public.model VALUES (199, 'Brougham', 67);
INSERT INTO public.model VALUES (200, 'Catera', 67);
INSERT INTO public.model VALUES (201, 'CT4', 67);
INSERT INTO public.model VALUES (202, 'CT4-V', 67);
INSERT INTO public.model VALUES (203, 'CT5', 67);
INSERT INTO public.model VALUES (204, 'CT5-V', 67);
INSERT INTO public.model VALUES (205, 'CT6', 67);
INSERT INTO public.model VALUES (206, 'CTS', 67);
INSERT INTO public.model VALUES (207, 'CTS-V', 67);
INSERT INTO public.model VALUES (208, 'DeVille', 67);
INSERT INTO public.model VALUES (209, 'DTS', 67);
INSERT INTO public.model VALUES (210, 'Eldorado', 67);
INSERT INTO public.model VALUES (211, 'ELR', 67);
INSERT INTO public.model VALUES (212, 'Escalade', 67);
INSERT INTO public.model VALUES (213, 'Escalade-V', 67);
INSERT INTO public.model VALUES (214, 'Fleetwood', 67);
INSERT INTO public.model VALUES (215, 'GT4', 67);
INSERT INTO public.model VALUES (216, 'LSE', 67);
INSERT INTO public.model VALUES (217, 'Lyriq', 67);
INSERT INTO public.model VALUES (218, 'Model 30', 67);
INSERT INTO public.model VALUES (219, 'Series 314', 67);
INSERT INTO public.model VALUES (220, 'Series 341', 67);
INSERT INTO public.model VALUES (221, 'Series 62', 67);
INSERT INTO public.model VALUES (222, 'Seville', 67);
INSERT INTO public.model VALUES (223, 'Sixty Special', 67);
INSERT INTO public.model VALUES (224, 'SRX', 67);
INSERT INTO public.model VALUES (225, 'STS', 67);
INSERT INTO public.model VALUES (226, 'XLR', 67);
INSERT INTO public.model VALUES (227, 'XT4', 67);
INSERT INTO public.model VALUES (228, 'XT5', 67);
INSERT INTO public.model VALUES (229, 'XT6', 67);
INSERT INTO public.model VALUES (230, 'XTS', 67);
INSERT INTO public.model VALUES (231, 'Alsvin', 10);
INSERT INTO public.model VALUES (232, 'Alsvin V7', 10);
INSERT INTO public.model VALUES (233, 'Auchan A600 EV', 10);
INSERT INTO public.model VALUES (234, 'Benben E-Star', 10);
INSERT INTO public.model VALUES (235, 'Benni', 10);
INSERT INTO public.model VALUES (236, 'Benni EC/EV', 10);
INSERT INTO public.model VALUES (237, 'CM-8', 10);
INSERT INTO public.model VALUES (238, 'CS15', 10);
INSERT INTO public.model VALUES (239, 'CS35', 10);
INSERT INTO public.model VALUES (240, 'CS35PLUS', 10);
INSERT INTO public.model VALUES (241, 'CS55', 10);
INSERT INTO public.model VALUES (242, 'CS55PLUS', 10);
INSERT INTO public.model VALUES (243, 'CS75', 10);
INSERT INTO public.model VALUES (244, 'CS75PLUS', 10);
INSERT INTO public.model VALUES (245, 'CS85', 10);
INSERT INTO public.model VALUES (246, 'CS95', 10);
INSERT INTO public.model VALUES (247, 'CS95PLUS', 10);
INSERT INTO public.model VALUES (248, 'CX20', 10);
INSERT INTO public.model VALUES (249, 'Eado', 10);
INSERT INTO public.model VALUES (250, 'Eado Plus', 10);
INSERT INTO public.model VALUES (251, 'Hunter', 10);
INSERT INTO public.model VALUES (252, 'Hunter Plus', 10);
INSERT INTO public.model VALUES (253, 'Kaicene F70', 10);
INSERT INTO public.model VALUES (254, 'Lamore', 10);
INSERT INTO public.model VALUES (255, 'Lantuozhe (Explorer)', 10);
INSERT INTO public.model VALUES (256, 'Linmax', 10);
INSERT INTO public.model VALUES (257, 'Lumin', 10);
INSERT INTO public.model VALUES (258, 'Raeton', 10);
INSERT INTO public.model VALUES (259, 'Raeton Plus', 10);
INSERT INTO public.model VALUES (260, 'Shenlan S7', 10);
INSERT INTO public.model VALUES (261, 'Shenlan SL03', 10);
INSERT INTO public.model VALUES (262, 'UNI-K', 10);
INSERT INTO public.model VALUES (263, 'UNI-T', 10);
INSERT INTO public.model VALUES (264, 'UNI-V', 10);
INSERT INTO public.model VALUES (265, 'Yida', 10);
INSERT INTO public.model VALUES (266, 'Z-Shine', 10);
INSERT INTO public.model VALUES (267, 'Amulet (A15)', 11);
INSERT INTO public.model VALUES (268, 'Arizzo 5', 11);
INSERT INTO public.model VALUES (269, 'Arizzo 5 GT', 11);
INSERT INTO public.model VALUES (270, 'Arizzo 5 Plus', 11);
INSERT INTO public.model VALUES (271, 'Arrizo 3', 11);
INSERT INTO public.model VALUES (272, 'Arrizo 6', 11);
INSERT INTO public.model VALUES (273, 'Arrizo 7', 11);
INSERT INTO public.model VALUES (274, 'Arrizo 8', 11);
INSERT INTO public.model VALUES (275, 'B13', 11);
INSERT INTO public.model VALUES (276, 'Bonus (A13)', 11);
INSERT INTO public.model VALUES (277, 'Bonus 3 (E3/A19)', 11);
INSERT INTO public.model VALUES (278, 'CrossEastar (B14)', 11);
INSERT INTO public.model VALUES (279, 'E5', 11);
INSERT INTO public.model VALUES (280, 'eQ1', 11);
INSERT INTO public.model VALUES (281, 'eQ5', 11);
INSERT INTO public.model VALUES (282, 'eQ7', 11);
INSERT INTO public.model VALUES (283, 'Explore 06', 11);
INSERT INTO public.model VALUES (284, 'Fora (A21)', 11);
INSERT INTO public.model VALUES (285, 'IndiS (S18D)', 11);
INSERT INTO public.model VALUES (286, 'Karry', 11);
INSERT INTO public.model VALUES (287, 'Kimo (A1)', 11);
INSERT INTO public.model VALUES (288, 'M11 (A3)', 11);
INSERT INTO public.model VALUES (289, 'Omoda 5', 11);
INSERT INTO public.model VALUES (290, 'Oriental Son (B11)', 11);
INSERT INTO public.model VALUES (291, 'QQ Ice Cream', 11);
INSERT INTO public.model VALUES (292, 'QQ6 (S21)', 11);
INSERT INTO public.model VALUES (293, 'QQme', 11);
INSERT INTO public.model VALUES (294, 'Sweet (QQ)', 11);
INSERT INTO public.model VALUES (295, 'Tiggo (T11)', 11);
INSERT INTO public.model VALUES (296, 'Tiggo 2', 11);
INSERT INTO public.model VALUES (297, 'Tiggo 2 Pro', 11);
INSERT INTO public.model VALUES (298, 'Tiggo 3', 11);
INSERT INTO public.model VALUES (299, 'Tiggo 3x', 11);
INSERT INTO public.model VALUES (300, 'Tiggo 3xe', 11);
INSERT INTO public.model VALUES (301, 'Tiggo 4', 11);
INSERT INTO public.model VALUES (302, 'Tiggo 4 Pro', 11);
INSERT INTO public.model VALUES (303, 'Tiggo 5', 11);
INSERT INTO public.model VALUES (304, 'Tiggo 5x', 11);
INSERT INTO public.model VALUES (305, 'Tiggo 7', 11);
INSERT INTO public.model VALUES (306, 'Tiggo 7 Plus', 11);
INSERT INTO public.model VALUES (307, 'Tiggo 7 Pro', 11);
INSERT INTO public.model VALUES (308, 'Tiggo 7 Pro Max', 11);
INSERT INTO public.model VALUES (309, 'Tiggo 7 Pro Plug-in Hybrid', 11);
INSERT INTO public.model VALUES (310, 'Tiggo 8', 11);
INSERT INTO public.model VALUES (311, 'Tiggo 8 Pro', 11);
INSERT INTO public.model VALUES (312, 'Tiggo 8 Pro e+', 11);
INSERT INTO public.model VALUES (313, 'Tiggo 8 Pro Max', 11);
INSERT INTO public.model VALUES (314, 'Tiggo 8 Pro Plug-in Hybrid', 11);
INSERT INTO public.model VALUES (315, 'Tiggo 9', 11);
INSERT INTO public.model VALUES (316, 'Very (A13)', 11);
INSERT INTO public.model VALUES (317, 'Windcloud (A11)', 11);
INSERT INTO public.model VALUES (318, '3000-Series', 12);
INSERT INTO public.model VALUES (319, 'Alero', 12);
INSERT INTO public.model VALUES (320, 'Apache', 12);
INSERT INTO public.model VALUES (321, 'Astra', 12);
INSERT INTO public.model VALUES (322, 'Astro', 12);
INSERT INTO public.model VALUES (323, 'Avalanche', 12);
INSERT INTO public.model VALUES (324, 'Aveo', 12);
INSERT INTO public.model VALUES (325, 'Bel Air', 12);
INSERT INTO public.model VALUES (326, 'Beretta', 12);
INSERT INTO public.model VALUES (327, 'Blazer', 12);
INSERT INTO public.model VALUES (328, 'Blazer K5', 12);
INSERT INTO public.model VALUES (329, 'Bolt', 12);
INSERT INTO public.model VALUES (330, 'Bolt EUV', 12);
INSERT INTO public.model VALUES (331, 'C-10', 12);
INSERT INTO public.model VALUES (332, 'C/K', 12);
INSERT INTO public.model VALUES (333, 'Camaro', 12);
INSERT INTO public.model VALUES (334, 'Caprice', 12);
INSERT INTO public.model VALUES (335, 'Captiva', 12);
INSERT INTO public.model VALUES (336, 'Captiva Sport', 12);
INSERT INTO public.model VALUES (337, 'Cavalier', 12);
INSERT INTO public.model VALUES (338, 'Celebrity', 12);
INSERT INTO public.model VALUES (339, 'Celta', 12);
INSERT INTO public.model VALUES (340, 'Chevelle', 12);
INSERT INTO public.model VALUES (341, 'Chevette', 12);
INSERT INTO public.model VALUES (342, 'Citation', 12);
INSERT INTO public.model VALUES (343, 'Cobalt', 12);
INSERT INTO public.model VALUES (344, 'Colorado', 12);
INSERT INTO public.model VALUES (345, 'Corsa', 12);
INSERT INTO public.model VALUES (346, 'Corsica', 12);
INSERT INTO public.model VALUES (347, 'Corvair', 12);
INSERT INTO public.model VALUES (348, 'Corvette', 12);
INSERT INTO public.model VALUES (349, 'Cruze', 12);
INSERT INTO public.model VALUES (350, 'Cruze (HR)', 12);
INSERT INTO public.model VALUES (351, 'CSV CR8', 12);
INSERT INTO public.model VALUES (352, 'Damas', 12);
INSERT INTO public.model VALUES (353, 'Deluxe', 12);
INSERT INTO public.model VALUES (354, 'El Camino', 12);
INSERT INTO public.model VALUES (355, 'Epica', 12);
INSERT INTO public.model VALUES (356, 'Equinox', 12);
INSERT INTO public.model VALUES (357, 'Evanda', 12);
INSERT INTO public.model VALUES (358, 'Express', 12);
INSERT INTO public.model VALUES (359, 'Fleetmaster', 12);
INSERT INTO public.model VALUES (360, 'Groove', 12);
INSERT INTO public.model VALUES (361, 'HHR', 12);
INSERT INTO public.model VALUES (362, 'Impala', 12);
INSERT INTO public.model VALUES (363, 'Kalos', 12);
INSERT INTO public.model VALUES (364, 'Lacetti', 12);
INSERT INTO public.model VALUES (365, 'Lanos', 12);
INSERT INTO public.model VALUES (366, 'Lumina', 12);
INSERT INTO public.model VALUES (367, 'Lumina APV', 12);
INSERT INTO public.model VALUES (368, 'LUV D-MAX', 12);
INSERT INTO public.model VALUES (369, 'Malibu', 12);
INSERT INTO public.model VALUES (370, 'Master', 12);
INSERT INTO public.model VALUES (371, 'Matiz', 12);
INSERT INTO public.model VALUES (372, 'Menlo', 12);
INSERT INTO public.model VALUES (373, 'Metro', 12);
INSERT INTO public.model VALUES (374, 'Monte Carlo', 12);
INSERT INTO public.model VALUES (375, 'Monza', 12);
INSERT INTO public.model VALUES (376, 'MW', 12);
INSERT INTO public.model VALUES (377, 'Nexia', 12);
INSERT INTO public.model VALUES (378, 'Niva', 12);
INSERT INTO public.model VALUES (379, 'Nova', 12);
INSERT INTO public.model VALUES (380, 'Nubira', 12);
INSERT INTO public.model VALUES (381, 'Omega', 12);
INSERT INTO public.model VALUES (382, 'Onix', 12);
INSERT INTO public.model VALUES (383, 'Orlando', 12);
INSERT INTO public.model VALUES (384, 'Prizm', 12);
INSERT INTO public.model VALUES (385, 'Rezzo', 12);
INSERT INTO public.model VALUES (386, 'S-10 Pickup', 12);
INSERT INTO public.model VALUES (387, 'Sail', 12);
INSERT INTO public.model VALUES (388, 'Seeker', 12);
INSERT INTO public.model VALUES (389, 'Silverado', 12);
INSERT INTO public.model VALUES (390, 'Sonic', 12);
INSERT INTO public.model VALUES (391, 'Spark', 12);
INSERT INTO public.model VALUES (392, 'Special DeLuxe', 12);
INSERT INTO public.model VALUES (393, 'Spin', 12);
INSERT INTO public.model VALUES (394, 'SS', 12);
INSERT INTO public.model VALUES (395, 'SSR', 12);
INSERT INTO public.model VALUES (396, 'Starcraft', 12);
INSERT INTO public.model VALUES (397, 'Suburban', 12);
INSERT INTO public.model VALUES (398, 'Tacuma', 12);
INSERT INTO public.model VALUES (399, 'Tahoe', 12);
INSERT INTO public.model VALUES (400, 'Tavera', 12);
INSERT INTO public.model VALUES (401, 'Tracker', 12);
INSERT INTO public.model VALUES (402, 'TrailBlazer', 12);
INSERT INTO public.model VALUES (403, 'Trans Sport', 12);
INSERT INTO public.model VALUES (404, 'Traverse', 12);
INSERT INTO public.model VALUES (405, 'Trax', 12);
INSERT INTO public.model VALUES (406, 'Uplander', 12);
INSERT INTO public.model VALUES (407, 'Van', 12);
INSERT INTO public.model VALUES (408, 'Vectra', 12);
INSERT INTO public.model VALUES (409, 'Venture', 12);
INSERT INTO public.model VALUES (410, 'Viva', 12);
INSERT INTO public.model VALUES (411, 'Volt', 12);
INSERT INTO public.model VALUES (412, 'Zafira', 12);
INSERT INTO public.model VALUES (413, '2 CV', 43);
INSERT INTO public.model VALUES (414, 'Ami', 43);
INSERT INTO public.model VALUES (415, 'Ami EV', 43);
INSERT INTO public.model VALUES (416, 'AX', 43);
INSERT INTO public.model VALUES (417, 'Berlingo', 43);
INSERT INTO public.model VALUES (418, 'BX', 43);
INSERT INTO public.model VALUES (419, 'C-Crosser', 43);
INSERT INTO public.model VALUES (420, 'C-Elysee', 43);
INSERT INTO public.model VALUES (421, 'C-Quatre', 43);
INSERT INTO public.model VALUES (422, 'C-Triomphe', 43);
INSERT INTO public.model VALUES (423, 'C-ZERO', 43);
INSERT INTO public.model VALUES (424, 'C1', 43);
INSERT INTO public.model VALUES (425, 'C2', 43);
INSERT INTO public.model VALUES (426, 'C3', 43);
INSERT INTO public.model VALUES (427, 'C3 Aircross', 43);
INSERT INTO public.model VALUES (428, 'C3 Picasso', 43);
INSERT INTO public.model VALUES (429, 'C4', 43);
INSERT INTO public.model VALUES (430, 'C4 Aircross', 43);
INSERT INTO public.model VALUES (431, 'C4 Cactus', 43);
INSERT INTO public.model VALUES (432, 'C4 Picasso', 43);
INSERT INTO public.model VALUES (433, 'C4 SpaceTourer', 43);
INSERT INTO public.model VALUES (434, 'C5', 43);
INSERT INTO public.model VALUES (435, 'C5 Aircross', 43);
INSERT INTO public.model VALUES (436, 'C5 X', 43);
INSERT INTO public.model VALUES (437, 'C6', 43);
INSERT INTO public.model VALUES (438, 'C8', 43);
INSERT INTO public.model VALUES (439, 'CX', 43);
INSERT INTO public.model VALUES (440, 'DS', 43);
INSERT INTO public.model VALUES (441, 'DS3', 43);
INSERT INTO public.model VALUES (442, 'DS4', 43);
INSERT INTO public.model VALUES (443, 'DS5', 43);
INSERT INTO public.model VALUES (444, 'Dyane', 43);
INSERT INTO public.model VALUES (445, 'E-Mehari', 43);
INSERT INTO public.model VALUES (446, 'Evasion', 43);
INSERT INTO public.model VALUES (447, 'GS', 43);
INSERT INTO public.model VALUES (448, 'Jumpy', 43);
INSERT INTO public.model VALUES (449, 'LN', 43);
INSERT INTO public.model VALUES (450, 'Nemo', 43);
INSERT INTO public.model VALUES (451, 'Saxo', 43);
INSERT INTO public.model VALUES (452, 'SM', 43);
INSERT INTO public.model VALUES (453, 'SpaceTourer', 43);
INSERT INTO public.model VALUES (454, 'Traction Avant', 43);
INSERT INTO public.model VALUES (455, 'Visa', 43);
INSERT INTO public.model VALUES (456, 'Xantia', 43);
INSERT INTO public.model VALUES (457, 'XM', 43);
INSERT INTO public.model VALUES (458, 'Xsara', 43);
INSERT INTO public.model VALUES (459, 'Xsara Picasso', 43);
INSERT INTO public.model VALUES (460, 'ZX', 43);
INSERT INTO public.model VALUES (461, 'Alpheon', 14);
INSERT INTO public.model VALUES (462, 'Arcadia', 14);
INSERT INTO public.model VALUES (463, 'Chairman', 14);
INSERT INTO public.model VALUES (464, 'Damas', 14);
INSERT INTO public.model VALUES (465, 'Espero', 14);
INSERT INTO public.model VALUES (466, 'Evanda', 14);
INSERT INTO public.model VALUES (467, 'G2X', 14);
INSERT INTO public.model VALUES (468, 'Gentra', 14);
INSERT INTO public.model VALUES (469, 'Kalos', 14);
INSERT INTO public.model VALUES (470, 'Korando', 14);
INSERT INTO public.model VALUES (471, 'Lacetti', 14);
INSERT INTO public.model VALUES (472, 'Lacetti Premiere', 14);
INSERT INTO public.model VALUES (473, 'Lanos', 14);
INSERT INTO public.model VALUES (474, 'Leganza', 14);
INSERT INTO public.model VALUES (475, 'LeMans', 14);
INSERT INTO public.model VALUES (476, 'Magnus', 14);
INSERT INTO public.model VALUES (477, 'Matiz', 14);
INSERT INTO public.model VALUES (478, 'Matiz Creative', 14);
INSERT INTO public.model VALUES (479, 'Musso', 14);
INSERT INTO public.model VALUES (480, 'Nexia', 14);
INSERT INTO public.model VALUES (481, 'Nubira', 14);
INSERT INTO public.model VALUES (482, 'Prince', 14);
INSERT INTO public.model VALUES (483, 'Racer', 14);
INSERT INTO public.model VALUES (484, 'Rezzo', 14);
INSERT INTO public.model VALUES (485, 'Royale', 14);
INSERT INTO public.model VALUES (486, 'Sens', 14);
INSERT INTO public.model VALUES (487, 'Tacuma', 14);
INSERT INTO public.model VALUES (488, 'Tico', 14);
INSERT INTO public.model VALUES (489, 'Tosca', 14);
INSERT INTO public.model VALUES (490, 'Winstorm', 14);
INSERT INTO public.model VALUES (491, '240Z', 44);
INSERT INTO public.model VALUES (492, '280Z', 44);
INSERT INTO public.model VALUES (493, '280ZX', 44);
INSERT INTO public.model VALUES (494, '720', 44);
INSERT INTO public.model VALUES (495, 'Bluebird', 44);
INSERT INTO public.model VALUES (496, 'Cherry', 44);
INSERT INTO public.model VALUES (497, 'GO', 44);
INSERT INTO public.model VALUES (498, 'GO+', 44);
INSERT INTO public.model VALUES (499, 'Laurel', 44);
INSERT INTO public.model VALUES (500, 'mi-DO', 44);
INSERT INTO public.model VALUES (501, 'on-DO', 44);
INSERT INTO public.model VALUES (502, 'Stanza', 44);
INSERT INTO public.model VALUES (503, 'Sunny', 44);
INSERT INTO public.model VALUES (504, 'Urvan', 44);
INSERT INTO public.model VALUES (505, 'Violet', 44);
INSERT INTO public.model VALUES (506, '600', 45);
INSERT INTO public.model VALUES (507, 'Aries', 45);
INSERT INTO public.model VALUES (508, 'Avenger', 45);
INSERT INTO public.model VALUES (509, 'Caliber', 45);
INSERT INTO public.model VALUES (510, 'Caravan', 45);
INSERT INTO public.model VALUES (511, 'Challenger', 45);
INSERT INTO public.model VALUES (512, 'Charger', 45);
INSERT INTO public.model VALUES (513, 'Charger Daytona', 45);
INSERT INTO public.model VALUES (514, 'Colt', 45);
INSERT INTO public.model VALUES (515, 'Custom Royal', 45);
INSERT INTO public.model VALUES (516, 'D/W Series', 45);
INSERT INTO public.model VALUES (517, 'D8', 45);
INSERT INTO public.model VALUES (518, 'Dakota', 45);
INSERT INTO public.model VALUES (519, 'Dart', 45);
INSERT INTO public.model VALUES (520, 'Daytona', 45);
INSERT INTO public.model VALUES (521, 'Diplomat', 45);
INSERT INTO public.model VALUES (522, 'Durango', 45);
INSERT INTO public.model VALUES (523, 'Dynasty', 45);
INSERT INTO public.model VALUES (524, 'Hornet', 45);
INSERT INTO public.model VALUES (525, 'Intrepid', 45);
INSERT INTO public.model VALUES (526, 'Journey', 45);
INSERT INTO public.model VALUES (527, 'Lancer', 45);
INSERT INTO public.model VALUES (528, 'Magnum', 45);
INSERT INTO public.model VALUES (529, 'Mayfair', 45);
INSERT INTO public.model VALUES (530, 'Monaco', 45);
INSERT INTO public.model VALUES (531, 'Neon', 45);
INSERT INTO public.model VALUES (532, 'Nitro', 45);
INSERT INTO public.model VALUES (533, 'Omni', 45);
INSERT INTO public.model VALUES (534, 'Polara', 45);
INSERT INTO public.model VALUES (535, 'Raider', 45);
INSERT INTO public.model VALUES (536, 'RAM', 45);
INSERT INTO public.model VALUES (537, 'RAM Van', 45);
INSERT INTO public.model VALUES (538, 'Ramcharger', 45);
INSERT INTO public.model VALUES (539, 'Shadow', 45);
INSERT INTO public.model VALUES (540, 'Spirit', 45);
INSERT INTO public.model VALUES (541, 'Stealth', 45);
INSERT INTO public.model VALUES (542, 'Stratus', 45);
INSERT INTO public.model VALUES (543, 'Super Bee', 45);
INSERT INTO public.model VALUES (544, 'Viper', 45);
INSERT INTO public.model VALUES (545, 'WC series', 45);
INSERT INTO public.model VALUES (546, 'LX', 46);
INSERT INTO public.model VALUES (547, 'RX', 46);
INSERT INTO public.model VALUES (548, 'TX', 46);
INSERT INTO public.model VALUES (549, 'TXL', 46);
INSERT INTO public.model VALUES (550, 'VX', 46);
INSERT INTO public.model VALUES (551, 'Yaoguang', 46);
INSERT INTO public.model VALUES (552, '208', 64);
INSERT INTO public.model VALUES (553, '308', 64);
INSERT INTO public.model VALUES (554, '250 GTO', 64);
INSERT INTO public.model VALUES (555, '296', 64);
INSERT INTO public.model VALUES (556, '328', 64);
INSERT INTO public.model VALUES (557, '348', 64);
INSERT INTO public.model VALUES (558, '360', 64);
INSERT INTO public.model VALUES (559, '400', 64);
INSERT INTO public.model VALUES (560, '412', 64);
INSERT INTO public.model VALUES (561, '456', 64);
INSERT INTO public.model VALUES (562, '458', 64);
INSERT INTO public.model VALUES (563, '488', 64);
INSERT INTO public.model VALUES (564, '512 BB', 64);
INSERT INTO public.model VALUES (565, '512 M', 64);
INSERT INTO public.model VALUES (566, '512 TR', 64);
INSERT INTO public.model VALUES (567, '550', 64);
INSERT INTO public.model VALUES (568, '575M', 64);
INSERT INTO public.model VALUES (569, '599', 64);
INSERT INTO public.model VALUES (570, '612', 64);
INSERT INTO public.model VALUES (571, '812', 64);
INSERT INTO public.model VALUES (572, 'California', 64);
INSERT INTO public.model VALUES (573, 'Daytona SP3', 64);
INSERT INTO public.model VALUES (574, 'Dino 206 GT', 64);
INSERT INTO public.model VALUES (575, 'Dino 208 GT4', 64);
INSERT INTO public.model VALUES (576, 'Dino 308 GT4', 64);
INSERT INTO public.model VALUES (577, 'Dino 246 GT', 64);
INSERT INTO public.model VALUES (578, 'Enzo', 64);
INSERT INTO public.model VALUES (579, 'F12berlinetta', 64);
INSERT INTO public.model VALUES (580, 'F355', 64);
INSERT INTO public.model VALUES (581, 'F40', 64);
INSERT INTO public.model VALUES (582, 'F430', 64);
INSERT INTO public.model VALUES (583, 'F50', 64);
INSERT INTO public.model VALUES (584, 'F8', 64);
INSERT INTO public.model VALUES (585, 'FF', 64);
INSERT INTO public.model VALUES (586, 'FXX K', 64);
INSERT INTO public.model VALUES (587, 'GTC4Lusso', 64);
INSERT INTO public.model VALUES (588, 'LaFerrari', 64);
INSERT INTO public.model VALUES (589, 'Mondial', 64);
INSERT INTO public.model VALUES (590, 'Monza SP', 64);
INSERT INTO public.model VALUES (591, 'Portofino', 64);
INSERT INTO public.model VALUES (592, 'Purosangue', 64);
INSERT INTO public.model VALUES (593, 'Roma', 64);
INSERT INTO public.model VALUES (594, 'SF90 Stradale', 64);
INSERT INTO public.model VALUES (595, 'Testarossa', 64);
INSERT INTO public.model VALUES (596, '124', 47);
INSERT INTO public.model VALUES (597, '124 Spider', 47);
INSERT INTO public.model VALUES (598, '124 Sport Spider', 47);
INSERT INTO public.model VALUES (599, '125', 47);
INSERT INTO public.model VALUES (600, '126', 47);
INSERT INTO public.model VALUES (601, '127', 47);
INSERT INTO public.model VALUES (602, '128', 47);
INSERT INTO public.model VALUES (603, '130', 47);
INSERT INTO public.model VALUES (604, '131', 47);
INSERT INTO public.model VALUES (605, '132', 47);
INSERT INTO public.model VALUES (606, '2300', 47);
INSERT INTO public.model VALUES (607, '238', 47);
INSERT INTO public.model VALUES (608, '500', 47);
INSERT INTO public.model VALUES (609, '500L', 47);
INSERT INTO public.model VALUES (610, '500X', 47);
INSERT INTO public.model VALUES (611, '508', 47);
INSERT INTO public.model VALUES (612, '600', 47);
INSERT INTO public.model VALUES (613, '600e', 47);
INSERT INTO public.model VALUES (614, '900T', 47);
INSERT INTO public.model VALUES (615, 'Albea', 47);
INSERT INTO public.model VALUES (616, 'Argenta', 47);
INSERT INTO public.model VALUES (617, 'Barchetta', 47);
INSERT INTO public.model VALUES (618, 'Brava', 47);
INSERT INTO public.model VALUES (619, 'Bravo', 47);
INSERT INTO public.model VALUES (620, 'Cinquecento', 47);
INSERT INTO public.model VALUES (621, 'Coupe', 47);
INSERT INTO public.model VALUES (622, 'Croma', 47);
INSERT INTO public.model VALUES (623, 'Doblo', 47);
INSERT INTO public.model VALUES (624, 'Duna', 47);
INSERT INTO public.model VALUES (625, 'Egea', 47);
INSERT INTO public.model VALUES (626, 'Fiorino', 47);
INSERT INTO public.model VALUES (627, 'Freemont', 47);
INSERT INTO public.model VALUES (628, 'Fullback', 47);
INSERT INTO public.model VALUES (629, 'Idea', 47);
INSERT INTO public.model VALUES (630, 'Linea', 47);
INSERT INTO public.model VALUES (631, 'Marea', 47);
INSERT INTO public.model VALUES (632, 'Multipla', 47);
INSERT INTO public.model VALUES (633, 'Palio', 47);
INSERT INTO public.model VALUES (634, 'Panda', 47);
INSERT INTO public.model VALUES (635, 'Punto', 47);
INSERT INTO public.model VALUES (636, 'Qubo', 47);
INSERT INTO public.model VALUES (637, 'Regata', 47);
INSERT INTO public.model VALUES (638, 'Ritmo', 47);
INSERT INTO public.model VALUES (639, 'Scudo', 47);
INSERT INTO public.model VALUES (640, 'Sedici', 47);
INSERT INTO public.model VALUES (641, 'Seicento', 47);
INSERT INTO public.model VALUES (642, 'Siena', 47);
INSERT INTO public.model VALUES (643, 'Stilo', 47);
INSERT INTO public.model VALUES (644, 'Strada', 47);
INSERT INTO public.model VALUES (645, 'Tempra', 47);
INSERT INTO public.model VALUES (646, 'Tipo', 47);
INSERT INTO public.model VALUES (647, 'Ulysse', 47);
INSERT INTO public.model VALUES (648, 'Uno', 47);
INSERT INTO public.model VALUES (649, 'Aerostar', 15);
INSERT INTO public.model VALUES (650, 'Aspire', 15);
INSERT INTO public.model VALUES (651, 'B-MAX', 15);
INSERT INTO public.model VALUES (652, 'Bronco', 15);
INSERT INTO public.model VALUES (653, 'Bronco Sport', 15);
INSERT INTO public.model VALUES (654, 'Bronco-II', 15);
INSERT INTO public.model VALUES (655, 'C-MAX', 15);
INSERT INTO public.model VALUES (656, 'Capri', 15);
INSERT INTO public.model VALUES (657, 'Consul', 15);
INSERT INTO public.model VALUES (658, 'Contour', 15);
INSERT INTO public.model VALUES (659, 'Cortina', 15);
INSERT INTO public.model VALUES (660, 'Cougar', 15);
INSERT INTO public.model VALUES (661, 'Country Squire', 15);
INSERT INTO public.model VALUES (662, 'Crown Victoria', 15);
INSERT INTO public.model VALUES (663, 'Custom', 15);
INSERT INTO public.model VALUES (664, 'Econoline', 15);
INSERT INTO public.model VALUES (665, 'Econovan', 15);
INSERT INTO public.model VALUES (666, 'EcoSport', 15);
INSERT INTO public.model VALUES (667, 'Edge', 15);
INSERT INTO public.model VALUES (668, 'Equator', 15);
INSERT INTO public.model VALUES (669, 'Equator Sport', 15);
INSERT INTO public.model VALUES (670, 'Escape', 15);
INSERT INTO public.model VALUES (671, 'Escort', 15);
INSERT INTO public.model VALUES (672, 'Everest', 15);
INSERT INTO public.model VALUES (673, 'Evos', 15);
INSERT INTO public.model VALUES (674, 'Excursion', 15);
INSERT INTO public.model VALUES (675, 'Expedition', 15);
INSERT INTO public.model VALUES (676, 'Explorer', 15);
INSERT INTO public.model VALUES (677, 'Explorer Sport Trac', 15);
INSERT INTO public.model VALUES (678, 'F-150', 15);
INSERT INTO public.model VALUES (679, 'F-2', 15);
INSERT INTO public.model VALUES (680, 'Fairlane', 15);
INSERT INTO public.model VALUES (681, 'Fairmont', 15);
INSERT INTO public.model VALUES (682, 'Falcon', 15);
INSERT INTO public.model VALUES (683, 'Festiva', 15);
INSERT INTO public.model VALUES (684, 'Fiesta', 15);
INSERT INTO public.model VALUES (685, 'Fiesta ST', 15);
INSERT INTO public.model VALUES (686, 'Five Hundred', 15);
INSERT INTO public.model VALUES (687, 'Flex', 15);
INSERT INTO public.model VALUES (688, 'Focus', 15);
INSERT INTO public.model VALUES (689, 'Focus RS', 15);
INSERT INTO public.model VALUES (690, 'Focus ST', 15);
INSERT INTO public.model VALUES (691, 'Freda', 15);
INSERT INTO public.model VALUES (692, 'Freestar', 15);
INSERT INTO public.model VALUES (693, 'Freestyle', 15);
INSERT INTO public.model VALUES (694, 'Fusion', 15);
INSERT INTO public.model VALUES (695, 'Galaxie', 15);
INSERT INTO public.model VALUES (696, 'Galaxy', 15);
INSERT INTO public.model VALUES (697, 'GPA', 15);
INSERT INTO public.model VALUES (698, 'Granada', 15);
INSERT INTO public.model VALUES (699, 'GT', 15);
INSERT INTO public.model VALUES (700, 'GT40', 15);
INSERT INTO public.model VALUES (701, 'Ikon', 15);
INSERT INTO public.model VALUES (702, 'Ixion', 15);
INSERT INTO public.model VALUES (703, 'KA', 15);
INSERT INTO public.model VALUES (704, 'Kuga', 15);
INSERT INTO public.model VALUES (705, 'Laser', 15);
INSERT INTO public.model VALUES (706, 'LTD Country Squire', 15);
INSERT INTO public.model VALUES (707, 'LTD Crown Victoria', 15);
INSERT INTO public.model VALUES (708, 'M151', 15);
INSERT INTO public.model VALUES (709, 'Mainline', 15);
INSERT INTO public.model VALUES (710, 'Maverick', 15);
INSERT INTO public.model VALUES (711, 'Model A', 15);
INSERT INTO public.model VALUES (712, 'Model T', 15);
INSERT INTO public.model VALUES (713, 'Mondeo', 15);
INSERT INTO public.model VALUES (714, 'Mondeo ST', 15);
INSERT INTO public.model VALUES (715, 'Mustang', 15);
INSERT INTO public.model VALUES (716, 'Mustang Mach-E', 15);
INSERT INTO public.model VALUES (717, 'Orion', 15);
INSERT INTO public.model VALUES (718, 'Probe', 15);
INSERT INTO public.model VALUES (719, 'Puma', 15);
INSERT INTO public.model VALUES (720, 'Puma ST', 15);
INSERT INTO public.model VALUES (721, 'Ranchero', 15);
INSERT INTO public.model VALUES (722, 'Ranger', 15);
INSERT INTO public.model VALUES (723, 'S-MAX', 15);
INSERT INTO public.model VALUES (724, 'Scorpio', 15);
INSERT INTO public.model VALUES (725, 'Sierra', 15);
INSERT INTO public.model VALUES (726, 'Spectron', 15);
INSERT INTO public.model VALUES (727, 'Taunus', 15);
INSERT INTO public.model VALUES (728, 'Taurus', 15);
INSERT INTO public.model VALUES (729, 'Taurus X', 15);
INSERT INTO public.model VALUES (730, 'Telstar', 15);
INSERT INTO public.model VALUES (731, 'Tempo', 15);
INSERT INTO public.model VALUES (732, 'Territory', 15);
INSERT INTO public.model VALUES (733, 'Thunderbird', 15);
INSERT INTO public.model VALUES (734, 'Torino', 15);
INSERT INTO public.model VALUES (735, 'Tourneo Connect', 15);
INSERT INTO public.model VALUES (736, 'Tourneo Courier', 15);
INSERT INTO public.model VALUES (737, 'Tourneo Custom', 15);
INSERT INTO public.model VALUES (738, 'Transit', 15);
INSERT INTO public.model VALUES (739, 'Transit Connect', 15);
INSERT INTO public.model VALUES (740, 'Transit Custom', 15);
INSERT INTO public.model VALUES (741, 'V8', 15);
INSERT INTO public.model VALUES (742, 'Windstar', 15);
INSERT INTO public.model VALUES (743, 'Zephyr', 15);
INSERT INTO public.model VALUES (744, 'Atlas', 13);
INSERT INTO public.model VALUES (745, 'Atlas Pro', 13);
INSERT INTO public.model VALUES (746, 'Azkarra', 13);
INSERT INTO public.model VALUES (747, 'Beauty Leopard', 13);
INSERT INTO public.model VALUES (748, 'Binrui', 13);
INSERT INTO public.model VALUES (749, 'Binrui Cool', 13);
INSERT INTO public.model VALUES (750, 'Binyue', 13);
INSERT INTO public.model VALUES (751, 'Binyue Cool', 13);
INSERT INTO public.model VALUES (752, 'Boyue', 13);
INSERT INTO public.model VALUES (753, 'Boyue Cool', 13);
INSERT INTO public.model VALUES (754, 'Boyue Pro', 13);
INSERT INTO public.model VALUES (755, 'CK', 13);
INSERT INTO public.model VALUES (756, 'Coolray', 13);
INSERT INTO public.model VALUES (757, 'Emgrand', 13);
INSERT INTO public.model VALUES (758, 'Emgrand 7', 13);
INSERT INTO public.model VALUES (759, 'Emgrand EC7', 13);
INSERT INTO public.model VALUES (760, 'Emgrand EC8', 13);
INSERT INTO public.model VALUES (761, 'Emgrand GL', 13);
INSERT INTO public.model VALUES (762, 'Emgrand GT', 13);
INSERT INTO public.model VALUES (763, 'Emgrand L', 13);
INSERT INTO public.model VALUES (764, 'Emgrand X7', 13);
INSERT INTO public.model VALUES (765, 'FC', 13);
INSERT INTO public.model VALUES (766, 'Galaxy L6', 13);
INSERT INTO public.model VALUES (767, 'Galaxy L7', 13);
INSERT INTO public.model VALUES (768, 'GC6', 13);
INSERT INTO public.model VALUES (769, 'GC9', 13);
INSERT INTO public.model VALUES (770, 'Geometry A', 13);
INSERT INTO public.model VALUES (771, 'Geometry C', 13);
INSERT INTO public.model VALUES (772, 'Geometry E', 13);
INSERT INTO public.model VALUES (773, 'Geometry G6', 13);
INSERT INTO public.model VALUES (774, 'Geometry M6', 13);
INSERT INTO public.model VALUES (775, 'GS', 13);
INSERT INTO public.model VALUES (776, 'Haoqing', 13);
INSERT INTO public.model VALUES (777, 'Haoyue L', 13);
INSERT INTO public.model VALUES (778, 'Icon', 13);
INSERT INTO public.model VALUES (779, 'Jiaji', 13);
INSERT INTO public.model VALUES (780, 'Kandi EX3', 13);
INSERT INTO public.model VALUES (781, 'LC', 13);
INSERT INTO public.model VALUES (782, 'LC Cross', 13);
INSERT INTO public.model VALUES (783, 'MK', 13);
INSERT INTO public.model VALUES (784, 'MK Cross', 13);
INSERT INTO public.model VALUES (785, 'Monjaro', 13);
INSERT INTO public.model VALUES (786, 'MR', 13);
INSERT INTO public.model VALUES (787, 'Okavango', 13);
INSERT INTO public.model VALUES (788, 'Preface', 13);
INSERT INTO public.model VALUES (789, 'SC7', 13);
INSERT INTO public.model VALUES (790, 'Tugella', 13);
INSERT INTO public.model VALUES (791, 'TX4', 13);
INSERT INTO public.model VALUES (792, 'Vision X3', 13);
INSERT INTO public.model VALUES (793, 'Vision X3 Pro', 13);
INSERT INTO public.model VALUES (794, 'Vision X6', 13);
INSERT INTO public.model VALUES (795, 'Vision X6 Pro', 13);
INSERT INTO public.model VALUES (796, 'Xingyue', 13);
INSERT INTO public.model VALUES (797, 'Xingyue L', 13);
INSERT INTO public.model VALUES (798, 'Yuancheng FX', 13);
INSERT INTO public.model VALUES (799, 'Chitu', 24);
INSERT INTO public.model VALUES (800, 'DaGou', 24);
INSERT INTO public.model VALUES (801, 'Dargo', 24);
INSERT INTO public.model VALUES (802, 'F5', 24);
INSERT INTO public.model VALUES (803, 'F7', 24);
INSERT INTO public.model VALUES (804, 'F7x', 24);
INSERT INTO public.model VALUES (805, 'H2', 24);
INSERT INTO public.model VALUES (806, 'H4', 24);
INSERT INTO public.model VALUES (807, 'H5', 24);
INSERT INTO public.model VALUES (808, 'H6', 24);
INSERT INTO public.model VALUES (809, 'H6 Coupe', 24);
INSERT INTO public.model VALUES (810, 'H6S', 24);
INSERT INTO public.model VALUES (811, 'H8', 24);
INSERT INTO public.model VALUES (812, 'H9', 24);
INSERT INTO public.model VALUES (813, 'Jolion', 24);
INSERT INTO public.model VALUES (814, 'KuGou', 24);
INSERT INTO public.model VALUES (815, 'M6', 24);
INSERT INTO public.model VALUES (816, 'Menglong', 24);
INSERT INTO public.model VALUES (817, 'Shenshou', 24);
INSERT INTO public.model VALUES (818, 'Xiaolong', 24);
INSERT INTO public.model VALUES (819, 'Xiaolong Max', 24);
INSERT INTO public.model VALUES (820, 'Accord', 25);
INSERT INTO public.model VALUES (821, 'Acty', 25);
INSERT INTO public.model VALUES (822, 'Airwave', 25);
INSERT INTO public.model VALUES (823, 'Ascot', 25);
INSERT INTO public.model VALUES (824, 'Ascot Innova', 25);
INSERT INTO public.model VALUES (825, 'Avancier', 25);
INSERT INTO public.model VALUES (826, 'Ballade', 25);
INSERT INTO public.model VALUES (827, 'Beat', 25);
INSERT INTO public.model VALUES (828, 'Breeze', 25);
INSERT INTO public.model VALUES (829, 'Brio', 25);
INSERT INTO public.model VALUES (830, 'Capa', 25);
INSERT INTO public.model VALUES (831, 'City', 25);
INSERT INTO public.model VALUES (832, 'Civic', 25);
INSERT INTO public.model VALUES (833, 'Civic Ferio', 25);
INSERT INTO public.model VALUES (834, 'Civic Type R', 25);
INSERT INTO public.model VALUES (835, 'Clarity', 25);
INSERT INTO public.model VALUES (836, 'Concerto', 25);
INSERT INTO public.model VALUES (837, 'CR-V', 25);
INSERT INTO public.model VALUES (838, 'CR-X', 25);
INSERT INTO public.model VALUES (839, 'CR-Z', 25);
INSERT INTO public.model VALUES (840, 'Crider', 25);
INSERT INTO public.model VALUES (841, 'Crossroad', 25);
INSERT INTO public.model VALUES (842, 'Crosstour', 25);
INSERT INTO public.model VALUES (843, 'Domani', 25);
INSERT INTO public.model VALUES (844, 'Edix', 25);
INSERT INTO public.model VALUES (845, 'Element', 25);
INSERT INTO public.model VALUES (846, 'Elysion', 25);
INSERT INTO public.model VALUES (847, 'Envix', 25);
INSERT INTO public.model VALUES (848, 'Fit', 25);
INSERT INTO public.model VALUES (849, 'Fit Aria', 25);
INSERT INTO public.model VALUES (850, 'Fit Shuttle', 25);
INSERT INTO public.model VALUES (851, 'FR-V', 25);
INSERT INTO public.model VALUES (852, 'Freed', 25);
INSERT INTO public.model VALUES (853, 'Grace', 25);
INSERT INTO public.model VALUES (854, 'Horizon', 25);
INSERT INTO public.model VALUES (855, 'HR-V', 25);
INSERT INTO public.model VALUES (856, 'Insight', 25);
INSERT INTO public.model VALUES (857, 'Inspire', 25);
INSERT INTO public.model VALUES (858, 'Integra', 25);
INSERT INTO public.model VALUES (859, 'Integra SJ', 25);
INSERT INTO public.model VALUES (860, 'Jade', 25);
INSERT INTO public.model VALUES (861, 'Jazz', 25);
INSERT INTO public.model VALUES (862, 'Lagreat', 25);
INSERT INTO public.model VALUES (863, 'Legend', 25);
INSERT INTO public.model VALUES (864, 'Life', 25);
INSERT INTO public.model VALUES (865, 'Logo', 25);
INSERT INTO public.model VALUES (866, 'MDX', 25);
INSERT INTO public.model VALUES (867, 'Mobilio', 25);
INSERT INTO public.model VALUES (868, 'Mobilio Spike', 25);
INSERT INTO public.model VALUES (869, 'N-BOX', 25);
INSERT INTO public.model VALUES (870, 'N-BOX Slash', 25);
INSERT INTO public.model VALUES (871, 'N-One', 25);
INSERT INTO public.model VALUES (872, 'N-VAN', 25);
INSERT INTO public.model VALUES (873, 'N-WGN', 25);
INSERT INTO public.model VALUES (874, 'N360', 25);
INSERT INTO public.model VALUES (875, 'NSX', 25);
INSERT INTO public.model VALUES (876, 'Odyssey', 25);
INSERT INTO public.model VALUES (877, 'Orthia', 25);
INSERT INTO public.model VALUES (878, 'Partner', 25);
INSERT INTO public.model VALUES (879, 'Passport', 25);
INSERT INTO public.model VALUES (880, 'Pilot', 25);
INSERT INTO public.model VALUES (881, 'Prelude', 25);
INSERT INTO public.model VALUES (882, 'Quint', 25);
INSERT INTO public.model VALUES (883, 'Rafaga', 25);
INSERT INTO public.model VALUES (884, 'Ridgeline', 25);
INSERT INTO public.model VALUES (885, 'S-MX', 25);
INSERT INTO public.model VALUES (886, 'S2000', 25);
INSERT INTO public.model VALUES (887, 'S500', 25);
INSERT INTO public.model VALUES (888, 'S600', 25);
INSERT INTO public.model VALUES (889, 'S660', 25);
INSERT INTO public.model VALUES (890, 'Saber', 25);
INSERT INTO public.model VALUES (891, 'Shuttle', 25);
INSERT INTO public.model VALUES (892, 'Stepwgn', 25);
INSERT INTO public.model VALUES (893, 'Stream', 25);
INSERT INTO public.model VALUES (894, 'Street', 25);
INSERT INTO public.model VALUES (895, 'That S', 25);
INSERT INTO public.model VALUES (896, 'Today', 25);
INSERT INTO public.model VALUES (897, 'Torneo', 25);
INSERT INTO public.model VALUES (898, 'UR-V', 25);
INSERT INTO public.model VALUES (899, 'Vamos', 25);
INSERT INTO public.model VALUES (900, 'Vezel', 25);
INSERT INTO public.model VALUES (901, 'Vigor', 25);
INSERT INTO public.model VALUES (902, 'XR-V', 25);
INSERT INTO public.model VALUES (903, 'Z', 25);
INSERT INTO public.model VALUES (904, 'Zest', 25);
INSERT INTO public.model VALUES (905, 'ZR-V', 25);
INSERT INTO public.model VALUES (906, 'Accent', 5);
INSERT INTO public.model VALUES (907, 'Aslan', 5);
INSERT INTO public.model VALUES (908, 'Atos', 5);
INSERT INTO public.model VALUES (909, 'Avante', 5);
INSERT INTO public.model VALUES (910, 'Avante N', 5);
INSERT INTO public.model VALUES (911, 'Azera', 5);
INSERT INTO public.model VALUES (912, 'Bayon', 5);
INSERT INTO public.model VALUES (913, 'Casper', 5);
INSERT INTO public.model VALUES (914, 'Celesta', 5);
INSERT INTO public.model VALUES (915, 'Centennial', 5);
INSERT INTO public.model VALUES (916, 'Click', 5);
INSERT INTO public.model VALUES (917, 'Coupe', 5);
INSERT INTO public.model VALUES (918, 'Creta', 5);
INSERT INTO public.model VALUES (919, 'Custo', 5);
INSERT INTO public.model VALUES (920, 'Dynasty', 5);
INSERT INTO public.model VALUES (921, 'Elantra', 5);
INSERT INTO public.model VALUES (922, 'Elantra N', 5);
INSERT INTO public.model VALUES (923, 'Encino', 5);
INSERT INTO public.model VALUES (924, 'Entourage', 5);
INSERT INTO public.model VALUES (925, 'EON', 5);
INSERT INTO public.model VALUES (926, 'Equus', 5);
INSERT INTO public.model VALUES (927, 'Excel', 5);
INSERT INTO public.model VALUES (928, 'Galloper', 5);
INSERT INTO public.model VALUES (929, 'Genesis', 5);
INSERT INTO public.model VALUES (930, 'Genesis Coupe', 5);
INSERT INTO public.model VALUES (931, 'Getz', 5);
INSERT INTO public.model VALUES (932, 'Grace', 5);
INSERT INTO public.model VALUES (933, 'Grand Starex', 5);
INSERT INTO public.model VALUES (934, 'Grandeur', 5);
INSERT INTO public.model VALUES (935, 'H-1', 5);
INSERT INTO public.model VALUES (936, 'H200', 5);
INSERT INTO public.model VALUES (937, 'HB20', 5);
INSERT INTO public.model VALUES (938, 'i10', 5);
INSERT INTO public.model VALUES (939, 'i20', 5);
INSERT INTO public.model VALUES (940, 'i20 N', 5);
INSERT INTO public.model VALUES (941, 'i30', 5);
INSERT INTO public.model VALUES (942, 'i30 N', 5);
INSERT INTO public.model VALUES (943, 'i40', 5);
INSERT INTO public.model VALUES (944, 'IONIQ', 5);
INSERT INTO public.model VALUES (945, 'IONIQ 5', 5);
INSERT INTO public.model VALUES (946, 'IONIQ 5 N', 5);
INSERT INTO public.model VALUES (947, 'IONIQ 6', 5);
INSERT INTO public.model VALUES (948, 'ix20', 5);
INSERT INTO public.model VALUES (949, 'ix25', 5);
INSERT INTO public.model VALUES (950, 'ix35', 5);
INSERT INTO public.model VALUES (951, 'ix55', 5);
INSERT INTO public.model VALUES (952, 'Kona', 5);
INSERT INTO public.model VALUES (953, 'Kona N', 5);
INSERT INTO public.model VALUES (954, 'Lafesta', 5);
INSERT INTO public.model VALUES (955, 'Lantra', 5);
INSERT INTO public.model VALUES (956, 'Lavita', 5);
INSERT INTO public.model VALUES (957, 'Marcia', 5);
INSERT INTO public.model VALUES (958, 'Matrix', 5);
INSERT INTO public.model VALUES (959, 'Maxcruz', 5);
INSERT INTO public.model VALUES (960, 'Mistra', 5);
INSERT INTO public.model VALUES (961, 'Mufasa', 5);
INSERT INTO public.model VALUES (962, 'Palisade', 5);
INSERT INTO public.model VALUES (963, 'Pony', 5);
INSERT INTO public.model VALUES (964, 'Santa Cruz', 5);
INSERT INTO public.model VALUES (965, 'Santa Fe', 5);
INSERT INTO public.model VALUES (966, 'Santamo', 5);
INSERT INTO public.model VALUES (967, 'Scoupe', 5);
INSERT INTO public.model VALUES (968, 'Solaris', 5);
INSERT INTO public.model VALUES (969, 'Sonata', 5);
INSERT INTO public.model VALUES (970, 'Starex', 5);
INSERT INTO public.model VALUES (971, 'Staria', 5);
INSERT INTO public.model VALUES (972, 'Stellar', 5);
INSERT INTO public.model VALUES (973, 'Terracan', 5);
INSERT INTO public.model VALUES (974, 'Tiburon', 5);
INSERT INTO public.model VALUES (975, 'Trajet', 5);
INSERT INTO public.model VALUES (976, 'Tucson', 5);
INSERT INTO public.model VALUES (977, 'Tuscani', 5);
INSERT INTO public.model VALUES (978, 'Veloster', 5);
INSERT INTO public.model VALUES (979, 'Venue', 5);
INSERT INTO public.model VALUES (980, 'Veracruz', 5);
INSERT INTO public.model VALUES (981, 'Verna', 5);
INSERT INTO public.model VALUES (982, 'XG', 5);
INSERT INTO public.model VALUES (983, 'EX', 48);
INSERT INTO public.model VALUES (984, 'FX', 48);
INSERT INTO public.model VALUES (985, 'G', 48);
INSERT INTO public.model VALUES (986, 'I', 48);
INSERT INTO public.model VALUES (987, 'J', 48);
INSERT INTO public.model VALUES (988, 'JX', 48);
INSERT INTO public.model VALUES (989, 'M', 48);
INSERT INTO public.model VALUES (990, 'Q', 48);
INSERT INTO public.model VALUES (991, 'Q30', 48);
INSERT INTO public.model VALUES (992, 'Q40', 48);
INSERT INTO public.model VALUES (993, 'Q50', 48);
INSERT INTO public.model VALUES (994, 'Q60', 48);
INSERT INTO public.model VALUES (995, 'Q70', 48);
INSERT INTO public.model VALUES (996, 'QX30', 48);
INSERT INTO public.model VALUES (997, 'QX4', 48);
INSERT INTO public.model VALUES (998, 'QX50', 48);
INSERT INTO public.model VALUES (999, 'QX55', 48);
INSERT INTO public.model VALUES (1000, 'QX56', 48);
INSERT INTO public.model VALUES (1001, 'QX60', 48);
INSERT INTO public.model VALUES (1002, 'QX70', 48);
INSERT INTO public.model VALUES (1003, 'QX80', 48);
INSERT INTO public.model VALUES (1004, 'A5', 49);
INSERT INTO public.model VALUES (1005, 'iEV7L', 49);
INSERT INTO public.model VALUES (1006, 'iEV7S', 49);
INSERT INTO public.model VALUES (1007, 'iEVA50', 49);
INSERT INTO public.model VALUES (1008, 'iEVS4', 49);
INSERT INTO public.model VALUES (1009, 'J2 ', 49);
INSERT INTO public.model VALUES (1010, 'J3 ', 49);
INSERT INTO public.model VALUES (1011, 'J4 ', 49);
INSERT INTO public.model VALUES (1012, 'J5', 49);
INSERT INTO public.model VALUES (1013, 'J6 ', 49);
INSERT INTO public.model VALUES (1014, 'J7', 49);
INSERT INTO public.model VALUES (1015, 'JS3', 49);
INSERT INTO public.model VALUES (1016, 'JS4', 49);
INSERT INTO public.model VALUES (1017, 'JS6', 49);
INSERT INTO public.model VALUES (1018, 'M1 (Refine)', 49);
INSERT INTO public.model VALUES (1019, 'M5', 49);
INSERT INTO public.model VALUES (1020, 'S1', 49);
INSERT INTO public.model VALUES (1021, 'S3', 49);
INSERT INTO public.model VALUES (1022, 'S5', 49);
INSERT INTO public.model VALUES (1023, 'S7', 49);
INSERT INTO public.model VALUES (1024, 'Sehol A5 Plus', 49);
INSERT INTO public.model VALUES (1025, 'Sehol Aipao', 49);
INSERT INTO public.model VALUES (1026, 'Sehol E20X', 49);
INSERT INTO public.model VALUES (1027, 'Sehol X6', 49);
INSERT INTO public.model VALUES (1028, 'Sehol X8', 49);
INSERT INTO public.model VALUES (1029, 'Sehol X8 Plus', 49);
INSERT INTO public.model VALUES (1030, 'T6', 49);
INSERT INTO public.model VALUES (1031, 'T8', 49);
INSERT INTO public.model VALUES (1032, 'T8 Pro', 49);
INSERT INTO public.model VALUES (1033, 'T9 Hunter', 49);
INSERT INTO public.model VALUES (1034, 'E-Pace', 51);
INSERT INTO public.model VALUES (1035, 'E-type', 51);
INSERT INTO public.model VALUES (1036, 'F-Pace', 51);
INSERT INTO public.model VALUES (1037, 'F-Type', 51);
INSERT INTO public.model VALUES (1038, 'I-Pace', 51);
INSERT INTO public.model VALUES (1039, 'Mark 2', 51);
INSERT INTO public.model VALUES (1040, 'Mark IX', 51);
INSERT INTO public.model VALUES (1041, 'S-Type', 51);
INSERT INTO public.model VALUES (1042, 'X-Type', 51);
INSERT INTO public.model VALUES (1043, 'XE', 51);
INSERT INTO public.model VALUES (1044, 'XF', 51);
INSERT INTO public.model VALUES (1045, 'XFR', 51);
INSERT INTO public.model VALUES (1046, 'XJ', 51);
INSERT INTO public.model VALUES (1047, 'XJ220', 51);
INSERT INTO public.model VALUES (1048, 'XJR', 51);
INSERT INTO public.model VALUES (1049, 'XJS', 51);
INSERT INTO public.model VALUES (1050, 'XK', 51);
INSERT INTO public.model VALUES (1051, 'XKR', 51);
INSERT INTO public.model VALUES (1052, 'Avenger', 50);
INSERT INTO public.model VALUES (1053, 'Cherokee', 50);
INSERT INTO public.model VALUES (1054, 'CJ', 50);
INSERT INTO public.model VALUES (1055, 'Comanche', 50);
INSERT INTO public.model VALUES (1056, 'Commander', 50);
INSERT INTO public.model VALUES (1057, 'Compass', 50);
INSERT INTO public.model VALUES (1058, 'Gladiator', 50);
INSERT INTO public.model VALUES (1059, 'Grand Cherokee', 50);
INSERT INTO public.model VALUES (1060, 'Liberty', 50);
INSERT INTO public.model VALUES (1061, 'Renegade', 50);
INSERT INTO public.model VALUES (1062, 'Wagoneer', 50);
INSERT INTO public.model VALUES (1063, 'Wrangler', 50);
INSERT INTO public.model VALUES (1064, 'Avella', 26);
INSERT INTO public.model VALUES (1065, 'Borrego', 26);
INSERT INTO public.model VALUES (1066, 'Cadenza', 26);
INSERT INTO public.model VALUES (1067, 'Capital', 26);
INSERT INTO public.model VALUES (1068, 'Carens', 26);
INSERT INTO public.model VALUES (1069, 'Carnival', 26);
INSERT INTO public.model VALUES (1070, 'Carstar', 26);
INSERT INTO public.model VALUES (1071, 'Ceed', 26);
INSERT INTO public.model VALUES (1072, 'Ceed GT', 26);
INSERT INTO public.model VALUES (1073, 'Cerato', 26);
INSERT INTO public.model VALUES (1074, 'Clarus', 26);
INSERT INTO public.model VALUES (1075, 'Concord', 26);
INSERT INTO public.model VALUES (1076, 'Elan', 26);
INSERT INTO public.model VALUES (1077, 'Enterprise', 26);
INSERT INTO public.model VALUES (1078, 'EV5', 26);
INSERT INTO public.model VALUES (1079, 'EV6', 26);
INSERT INTO public.model VALUES (1080, 'EV9', 26);
INSERT INTO public.model VALUES (1081, 'Forte', 26);
INSERT INTO public.model VALUES (1082, 'Joice', 26);
INSERT INTO public.model VALUES (1083, 'K3', 26);
INSERT INTO public.model VALUES (1084, 'K5', 26);
INSERT INTO public.model VALUES (1085, 'K7', 26);
INSERT INTO public.model VALUES (1086, 'K8', 26);
INSERT INTO public.model VALUES (1087, 'K9', 26);
INSERT INTO public.model VALUES (1088, 'K900', 26);
INSERT INTO public.model VALUES (1089, 'KX1', 26);
INSERT INTO public.model VALUES (1090, 'KX3', 26);
INSERT INTO public.model VALUES (1091, 'KX5', 26);
INSERT INTO public.model VALUES (1092, 'Lotze', 26);
INSERT INTO public.model VALUES (1093, 'Magentis', 26);
INSERT INTO public.model VALUES (1094, 'Mentor', 26);
INSERT INTO public.model VALUES (1095, 'Mohave', 26);
INSERT INTO public.model VALUES (1096, 'Morning', 26);
INSERT INTO public.model VALUES (1097, 'Niro', 26);
INSERT INTO public.model VALUES (1098, 'Opirus', 26);
INSERT INTO public.model VALUES (1099, 'Optima', 26);
INSERT INTO public.model VALUES (1100, 'Pegas', 26);
INSERT INTO public.model VALUES (1101, 'Picanto', 26);
INSERT INTO public.model VALUES (1102, 'Potentia', 26);
INSERT INTO public.model VALUES (1103, 'Pregio', 26);
INSERT INTO public.model VALUES (1104, 'Pride', 26);
INSERT INTO public.model VALUES (1105, 'Proceed', 26);
INSERT INTO public.model VALUES (1106, 'Quanlima', 26);
INSERT INTO public.model VALUES (1107, 'Quoris', 26);
INSERT INTO public.model VALUES (1108, 'Ray', 26);
INSERT INTO public.model VALUES (1109, 'Retona', 26);
INSERT INTO public.model VALUES (1110, 'Rio', 26);
INSERT INTO public.model VALUES (1111, 'Sedona', 26);
INSERT INTO public.model VALUES (1112, 'Seltos', 26);
INSERT INTO public.model VALUES (1113, 'Sephia', 26);
INSERT INTO public.model VALUES (1114, 'Shuma', 26);
INSERT INTO public.model VALUES (1115, 'Sonet', 26);
INSERT INTO public.model VALUES (1116, 'Sorento', 26);
INSERT INTO public.model VALUES (1117, 'Soul', 26);
INSERT INTO public.model VALUES (1118, 'Soul EV', 26);
INSERT INTO public.model VALUES (1119, 'Spectra', 26);
INSERT INTO public.model VALUES (1120, 'Sportage', 26);
INSERT INTO public.model VALUES (1121, 'Stinger', 26);
INSERT INTO public.model VALUES (1122, 'Stonic', 26);
INSERT INTO public.model VALUES (1123, 'Telluride', 26);
INSERT INTO public.model VALUES (1124, 'Towner', 26);
INSERT INTO public.model VALUES (1125, 'Venga', 26);
INSERT INTO public.model VALUES (1126, 'Visto', 26);
INSERT INTO public.model VALUES (1127, 'X-Trek', 26);
INSERT INTO public.model VALUES (1128, 'XCeed', 26);
INSERT INTO public.model VALUES (1129, '1111 Ока', 9);
INSERT INTO public.model VALUES (1130, '2101', 9);
INSERT INTO public.model VALUES (1131, '2102', 9);
INSERT INTO public.model VALUES (1132, '2103', 9);
INSERT INTO public.model VALUES (1133, '2104', 9);
INSERT INTO public.model VALUES (1134, '2105', 9);
INSERT INTO public.model VALUES (1135, '2106', 9);
INSERT INTO public.model VALUES (1136, '2107', 9);
INSERT INTO public.model VALUES (1137, '2108', 9);
INSERT INTO public.model VALUES (1138, '2109', 9);
INSERT INTO public.model VALUES (1139, '21099', 9);
INSERT INTO public.model VALUES (1140, '2110', 9);
INSERT INTO public.model VALUES (1141, '2111', 9);
INSERT INTO public.model VALUES (1142, '2112', 9);
INSERT INTO public.model VALUES (1143, '2113', 9);
INSERT INTO public.model VALUES (1144, '2114', 9);
INSERT INTO public.model VALUES (1145, '2115', 9);
INSERT INTO public.model VALUES (1146, '2120 Надежда', 9);
INSERT INTO public.model VALUES (1147, '2121 (4x4)', 9);
INSERT INTO public.model VALUES (1148, '2123', 9);
INSERT INTO public.model VALUES (1149, '2129', 9);
INSERT INTO public.model VALUES (1150, '2131 (4x4)', 9);
INSERT INTO public.model VALUES (1151, '2328', 9);
INSERT INTO public.model VALUES (1152, '2329', 9);
INSERT INTO public.model VALUES (1153, 'EL Lada', 9);
INSERT INTO public.model VALUES (1154, 'Granta', 9);
INSERT INTO public.model VALUES (1155, 'Kalina', 9);
INSERT INTO public.model VALUES (1156, 'Largus', 9);
INSERT INTO public.model VALUES (1157, 'Niva', 9);
INSERT INTO public.model VALUES (1158, 'Niva Legend', 9);
INSERT INTO public.model VALUES (1159, 'Priora', 9);
INSERT INTO public.model VALUES (1160, 'Revolution', 9);
INSERT INTO public.model VALUES (1161, 'Vesta', 9);
INSERT INTO public.model VALUES (1162, 'X-cross 5', 9);
INSERT INTO public.model VALUES (1163, 'XRAY', 9);
INSERT INTO public.model VALUES (1164, '350 GT', 65);
INSERT INTO public.model VALUES (1165, '400 GT', 65);
INSERT INTO public.model VALUES (1166, 'Aventador', 65);
INSERT INTO public.model VALUES (1167, 'Centenario', 65);
INSERT INTO public.model VALUES (1168, 'Countach', 65);
INSERT INTO public.model VALUES (1169, 'Countach LPI 800-4', 65);
INSERT INTO public.model VALUES (1170, 'Diablo', 65);
INSERT INTO public.model VALUES (1171, 'Egoista', 65);
INSERT INTO public.model VALUES (1172, 'Espada', 65);
INSERT INTO public.model VALUES (1173, 'Gallardo', 65);
INSERT INTO public.model VALUES (1174, 'HuracГЎn', 65);
INSERT INTO public.model VALUES (1175, 'Islero', 65);
INSERT INTO public.model VALUES (1176, 'Jalpa', 65);
INSERT INTO public.model VALUES (1177, 'Jarama', 65);
INSERT INTO public.model VALUES (1178, 'LM001', 65);
INSERT INTO public.model VALUES (1179, 'LM002', 65);
INSERT INTO public.model VALUES (1180, 'Miura', 65);
INSERT INTO public.model VALUES (1181, 'Murcielago', 65);
INSERT INTO public.model VALUES (1182, 'Reventon', 65);
INSERT INTO public.model VALUES (1183, 'Revuelto', 65);
INSERT INTO public.model VALUES (1184, 'Sesto Elemento', 65);
INSERT INTO public.model VALUES (1185, 'Silhouette', 65);
INSERT INTO public.model VALUES (1186, 'SiГЎn', 65);
INSERT INTO public.model VALUES (1187, 'Urraco', 65);
INSERT INTO public.model VALUES (1188, 'Urus', 65);
INSERT INTO public.model VALUES (1189, 'Veneno', 65);
INSERT INTO public.model VALUES (1190, 'Defender', 28);
INSERT INTO public.model VALUES (1191, 'Discovery', 28);
INSERT INTO public.model VALUES (1192, 'Discovery Sport', 28);
INSERT INTO public.model VALUES (1193, 'Freelander', 28);
INSERT INTO public.model VALUES (1194, 'Range Rover', 28);
INSERT INTO public.model VALUES (1195, 'Range Rover Evoque', 28);
INSERT INTO public.model VALUES (1196, 'Range Rover Sport', 28);
INSERT INTO public.model VALUES (1197, 'Range Rover Velar', 28);
INSERT INTO public.model VALUES (1198, 'Series I', 28);
INSERT INTO public.model VALUES (1199, 'Series II', 28);
INSERT INTO public.model VALUES (1200, 'Series III', 28);
INSERT INTO public.model VALUES (1201, 'CT', 27);
INSERT INTO public.model VALUES (1202, 'ES', 27);
INSERT INTO public.model VALUES (1203, 'GS', 27);
INSERT INTO public.model VALUES (1204, 'GS F', 27);
INSERT INTO public.model VALUES (1205, 'GX', 27);
INSERT INTO public.model VALUES (1206, 'HS', 27);
INSERT INTO public.model VALUES (1207, 'IS', 27);
INSERT INTO public.model VALUES (1208, 'IS F', 27);
INSERT INTO public.model VALUES (1209, 'LBX', 27);
INSERT INTO public.model VALUES (1210, 'LC', 27);
INSERT INTO public.model VALUES (1211, 'LFA', 27);
INSERT INTO public.model VALUES (1212, 'LM', 27);
INSERT INTO public.model VALUES (1213, 'LS', 27);
INSERT INTO public.model VALUES (1214, 'LX', 27);
INSERT INTO public.model VALUES (1215, 'NX', 27);
INSERT INTO public.model VALUES (1216, 'RC', 27);
INSERT INTO public.model VALUES (1217, 'RC F', 27);
INSERT INTO public.model VALUES (1218, 'RX', 27);
INSERT INTO public.model VALUES (1219, 'RZ', 27);
INSERT INTO public.model VALUES (1220, 'SC', 27);
INSERT INTO public.model VALUES (1221, 'TX', 27);
INSERT INTO public.model VALUES (1222, 'UX', 27);
INSERT INTO public.model VALUES (1223, '650 EV', 54);
INSERT INTO public.model VALUES (1224, 'Breez', 54);
INSERT INTO public.model VALUES (1225, 'Cebrium', 54);
INSERT INTO public.model VALUES (1226, 'Celliya', 54);
INSERT INTO public.model VALUES (1227, 'Murman', 54);
INSERT INTO public.model VALUES (1228, 'Myway', 54);
INSERT INTO public.model VALUES (1229, 'Smily', 54);
INSERT INTO public.model VALUES (1230, 'Solano', 54);
INSERT INTO public.model VALUES (1231, 'X50', 54);
INSERT INTO public.model VALUES (1232, 'X60', 54);
INSERT INTO public.model VALUES (1233, 'X70', 54);
INSERT INTO public.model VALUES (1234, '1000', 33);
INSERT INTO public.model VALUES (1235, '121', 33);
INSERT INTO public.model VALUES (1236, '1300', 33);
INSERT INTO public.model VALUES (1237, '2', 33);
INSERT INTO public.model VALUES (1238, '3', 33);
INSERT INTO public.model VALUES (1239, '3 MPS', 33);
INSERT INTO public.model VALUES (1240, '323', 33);
INSERT INTO public.model VALUES (1241, '5', 33);
INSERT INTO public.model VALUES (1242, '6', 33);
INSERT INTO public.model VALUES (1243, '6 MPS', 33);
INSERT INTO public.model VALUES (1244, '616', 33);
INSERT INTO public.model VALUES (1245, '626', 33);
INSERT INTO public.model VALUES (1246, '818', 33);
INSERT INTO public.model VALUES (1247, '929', 33);
INSERT INTO public.model VALUES (1248, 'Atenza', 33);
INSERT INTO public.model VALUES (1249, 'Autozam AZ-3', 33);
INSERT INTO public.model VALUES (1250, 'Autozam Clef', 33);
INSERT INTO public.model VALUES (1251, 'Axela', 33);
INSERT INTO public.model VALUES (1252, 'AZ-1', 33);
INSERT INTO public.model VALUES (1253, 'AZ-Offroad', 33);
INSERT INTO public.model VALUES (1254, 'AZ-Wagon', 33);
INSERT INTO public.model VALUES (1255, 'B-series', 33);
INSERT INTO public.model VALUES (1256, 'Biante', 33);
INSERT INTO public.model VALUES (1257, 'Bongo', 33);
INSERT INTO public.model VALUES (1258, 'Bongo Friendee', 33);
INSERT INTO public.model VALUES (1259, 'BT-50', 33);
INSERT INTO public.model VALUES (1260, 'Capella', 33);
INSERT INTO public.model VALUES (1261, 'Carol', 33);
INSERT INTO public.model VALUES (1262, 'Chantez', 33);
INSERT INTO public.model VALUES (1263, 'Cosmo', 33);
INSERT INTO public.model VALUES (1264, 'Cronos', 33);
INSERT INTO public.model VALUES (1265, 'CX-3', 33);
INSERT INTO public.model VALUES (1266, 'CX-30', 33);
INSERT INTO public.model VALUES (1267, 'CX-4', 33);
INSERT INTO public.model VALUES (1268, 'CX-5', 33);
INSERT INTO public.model VALUES (1269, 'CX-50', 33);
INSERT INTO public.model VALUES (1270, 'CX-60', 33);
INSERT INTO public.model VALUES (1271, 'CX-7', 33);
INSERT INTO public.model VALUES (1272, 'CX-8', 33);
INSERT INTO public.model VALUES (1273, 'CX-9', 33);
INSERT INTO public.model VALUES (1274, 'CX-90', 33);
INSERT INTO public.model VALUES (1275, 'Demio', 33);
INSERT INTO public.model VALUES (1276, 'E-Series', 33);
INSERT INTO public.model VALUES (1277, 'Efini MS-6', 33);
INSERT INTO public.model VALUES (1278, 'Efini MS-8', 33);
INSERT INTO public.model VALUES (1279, 'Efini MS-9', 33);
INSERT INTO public.model VALUES (1280, 'Etude', 33);
INSERT INTO public.model VALUES (1281, 'Eunos 100', 33);
INSERT INTO public.model VALUES (1282, 'Eunos 300', 33);
INSERT INTO public.model VALUES (1283, 'Eunos 500', 33);
INSERT INTO public.model VALUES (1284, 'Eunos 800', 33);
INSERT INTO public.model VALUES (1285, 'Eunos Cosmo', 33);
INSERT INTO public.model VALUES (1286, 'Eunos Presso', 33);
INSERT INTO public.model VALUES (1287, 'Familia', 33);
INSERT INTO public.model VALUES (1288, 'Flair', 33);
INSERT INTO public.model VALUES (1289, 'Flair Crossover', 33);
INSERT INTO public.model VALUES (1290, 'Flair Wagon', 33);
INSERT INTO public.model VALUES (1291, 'Lantis', 33);
INSERT INTO public.model VALUES (1292, 'Laputa', 33);
INSERT INTO public.model VALUES (1293, 'Luce', 33);
INSERT INTO public.model VALUES (1294, 'Millenia', 33);
INSERT INTO public.model VALUES (1295, 'MPV', 33);
INSERT INTO public.model VALUES (1296, 'MX-3', 33);
INSERT INTO public.model VALUES (1297, 'MX-30', 33);
INSERT INTO public.model VALUES (1298, 'MX-5', 33);
INSERT INTO public.model VALUES (1299, 'MX-6', 33);
INSERT INTO public.model VALUES (1300, 'Navajo', 33);
INSERT INTO public.model VALUES (1301, 'Persona', 33);
INSERT INTO public.model VALUES (1302, 'Premacy', 33);
INSERT INTO public.model VALUES (1303, 'Proceed', 33);
INSERT INTO public.model VALUES (1304, 'Proceed Levante', 33);
INSERT INTO public.model VALUES (1305, 'Proceed Marvie', 33);
INSERT INTO public.model VALUES (1306, 'Protege', 33);
INSERT INTO public.model VALUES (1307, 'R360', 33);
INSERT INTO public.model VALUES (1308, 'Revue', 33);
INSERT INTO public.model VALUES (1309, 'Roadster', 33);
INSERT INTO public.model VALUES (1310, 'RX-5', 33);
INSERT INTO public.model VALUES (1311, 'RX-7', 33);
INSERT INTO public.model VALUES (1312, 'RX-8', 33);
INSERT INTO public.model VALUES (1313, 'Scrum', 33);
INSERT INTO public.model VALUES (1314, 'Sentia', 33);
INSERT INTO public.model VALUES (1315, 'Spiano', 33);
INSERT INTO public.model VALUES (1316, 'Tribute', 33);
INSERT INTO public.model VALUES (1317, 'Verisa', 33);
INSERT INTO public.model VALUES (1318, 'Xedos 6', 33);
INSERT INTO public.model VALUES (1319, 'Xedos 9', 33);
INSERT INTO public.model VALUES (1320, 'W201', 3);
INSERT INTO public.model VALUES (1321, '190 SL', 3);
INSERT INTO public.model VALUES (1322, 'W187', 3);
INSERT INTO public.model VALUES (1323, 'A-class', 3);
INSERT INTO public.model VALUES (1324, 'A-class AMG', 3);
INSERT INTO public.model VALUES (1325, 'AMG GT', 3);
INSERT INTO public.model VALUES (1326, 'AMG ONE', 3);
INSERT INTO public.model VALUES (1327, 'B-class', 3);
INSERT INTO public.model VALUES (1328, 'C-class', 3);
INSERT INTO public.model VALUES (1329, 'C-class AMG', 3);
INSERT INTO public.model VALUES (1330, 'Citan', 3);
INSERT INTO public.model VALUES (1331, 'CL-class', 3);
INSERT INTO public.model VALUES (1332, 'CL-class AMG', 3);
INSERT INTO public.model VALUES (1333, 'CLA', 3);
INSERT INTO public.model VALUES (1334, 'CLA AMG', 3);
INSERT INTO public.model VALUES (1335, 'CLC-class', 3);
INSERT INTO public.model VALUES (1336, 'CLE', 3);
INSERT INTO public.model VALUES (1337, 'CLE AMG', 3);
INSERT INTO public.model VALUES (1338, 'CLK AMG GTR', 3);
INSERT INTO public.model VALUES (1339, 'CLK-class', 3);
INSERT INTO public.model VALUES (1340, 'CLK-class AMG', 3);
INSERT INTO public.model VALUES (1341, 'CLS', 3);
INSERT INTO public.model VALUES (1342, 'CLS AMG', 3);
INSERT INTO public.model VALUES (1343, 'E-class', 3);
INSERT INTO public.model VALUES (1344, 'E-class AMG', 3);
INSERT INTO public.model VALUES (1345, 'EQA', 3);
INSERT INTO public.model VALUES (1346, 'EQB', 3);
INSERT INTO public.model VALUES (1347, 'EQC', 3);
INSERT INTO public.model VALUES (1348, 'EQE', 3);
INSERT INTO public.model VALUES (1349, 'EQE AMG', 3);
INSERT INTO public.model VALUES (1350, 'EQE SUV', 3);
INSERT INTO public.model VALUES (1351, 'EQE SUV AMG', 3);
INSERT INTO public.model VALUES (1352, 'EQS', 3);
INSERT INTO public.model VALUES (1353, 'EQS AMG', 3);
INSERT INTO public.model VALUES (1354, 'EQS SUV', 3);
INSERT INTO public.model VALUES (1355, 'EQV', 3);
INSERT INTO public.model VALUES (1356, 'G-class', 3);
INSERT INTO public.model VALUES (1357, 'G-class AMG', 3);
INSERT INTO public.model VALUES (1358, 'G-class AMG 6x6', 3);
INSERT INTO public.model VALUES (1359, 'GL-class', 3);
INSERT INTO public.model VALUES (1360, 'GL-class AMG', 3);
INSERT INTO public.model VALUES (1361, 'GLA', 3);
INSERT INTO public.model VALUES (1362, 'GLA AMG', 3);
INSERT INTO public.model VALUES (1363, 'GLB', 3);
INSERT INTO public.model VALUES (1364, 'GLB AMG', 3);
INSERT INTO public.model VALUES (1365, 'GLC', 3);
INSERT INTO public.model VALUES (1366, 'GLC AMG', 3);
INSERT INTO public.model VALUES (1367, 'GLC Coupe', 3);
INSERT INTO public.model VALUES (1368, 'GLC Coupe AMG', 3);
INSERT INTO public.model VALUES (1369, 'GLE', 3);
INSERT INTO public.model VALUES (1370, 'GLE AMG', 3);
INSERT INTO public.model VALUES (1371, 'GLE Coupe', 3);
INSERT INTO public.model VALUES (1372, 'GLE Coupe AMG', 3);
INSERT INTO public.model VALUES (1373, 'GLK-class', 3);
INSERT INTO public.model VALUES (1374, 'GLS', 3);
INSERT INTO public.model VALUES (1375, 'GLS AMG', 3);
INSERT INTO public.model VALUES (1376, 'M-class', 3);
INSERT INTO public.model VALUES (1377, 'M-class AMG', 3);
INSERT INTO public.model VALUES (1378, 'Marco Polo', 3);
INSERT INTO public.model VALUES (1379, 'Maybach EQS SUV', 3);
INSERT INTO public.model VALUES (1380, 'Maybach G 650 Landaulet', 3);
INSERT INTO public.model VALUES (1381, 'Maybach GLS', 3);
INSERT INTO public.model VALUES (1382, 'Maybach S-class', 3);
INSERT INTO public.model VALUES (1383, 'Metris', 3);
INSERT INTO public.model VALUES (1384, 'R-class', 3);
INSERT INTO public.model VALUES (1385, 'R-class AMG', 3);
INSERT INTO public.model VALUES (1386, 'S-class', 3);
INSERT INTO public.model VALUES (1387, 'S-class AMG', 3);
INSERT INTO public.model VALUES (1388, 'Simplex', 3);
INSERT INTO public.model VALUES (1389, 'SL-class', 3);
INSERT INTO public.model VALUES (1390, 'SL-class AMG', 3);
INSERT INTO public.model VALUES (1391, 'SLC', 3);
INSERT INTO public.model VALUES (1392, 'SLC AMG', 3);
INSERT INTO public.model VALUES (1393, 'SLK-class', 3);
INSERT INTO public.model VALUES (1394, 'SLK-class AMG', 3);
INSERT INTO public.model VALUES (1395, 'SLR McLaren', 3);
INSERT INTO public.model VALUES (1396, 'SLS AMG', 3);
INSERT INTO public.model VALUES (1397, 'T-class', 3);
INSERT INTO public.model VALUES (1398, 'V-class', 3);
INSERT INTO public.model VALUES (1399, 'Vaneo', 3);
INSERT INTO public.model VALUES (1400, 'Viano', 3);
INSERT INTO public.model VALUES (1401, 'Vito', 3);
INSERT INTO public.model VALUES (1402, 'W100', 3);
INSERT INTO public.model VALUES (1403, 'W105', 3);
INSERT INTO public.model VALUES (1404, 'W108', 3);
INSERT INTO public.model VALUES (1405, 'W110', 3);
INSERT INTO public.model VALUES (1406, 'W111', 3);
INSERT INTO public.model VALUES (1407, 'W114', 3);
INSERT INTO public.model VALUES (1408, 'W115', 3);
INSERT INTO public.model VALUES (1409, 'W120', 3);
INSERT INTO public.model VALUES (1410, 'W121', 3);
INSERT INTO public.model VALUES (1411, 'W123', 3);
INSERT INTO public.model VALUES (1412, 'W124', 3);
INSERT INTO public.model VALUES (1413, 'W128', 3);
INSERT INTO public.model VALUES (1414, 'W136', 3);
INSERT INTO public.model VALUES (1415, 'W138', 3);
INSERT INTO public.model VALUES (1416, 'W142', 3);
INSERT INTO public.model VALUES (1417, 'W180', 3);
INSERT INTO public.model VALUES (1418, 'W186', 3);
INSERT INTO public.model VALUES (1419, 'W188', 3);
INSERT INTO public.model VALUES (1420, 'W189', 3);
INSERT INTO public.model VALUES (1421, 'W191', 3);
INSERT INTO public.model VALUES (1422, 'W21', 3);
INSERT INTO public.model VALUES (1423, 'W29', 3);
INSERT INTO public.model VALUES (1424, 'X-class', 3);
INSERT INTO public.model VALUES (1425, '3000 GT', 34);
INSERT INTO public.model VALUES (1426, '500', 34);
INSERT INTO public.model VALUES (1427, 'Airtrek', 34);
INSERT INTO public.model VALUES (1428, 'Aspire', 34);
INSERT INTO public.model VALUES (1429, 'ASX', 34);
INSERT INTO public.model VALUES (1430, 'Attrage', 34);
INSERT INTO public.model VALUES (1431, 'Bravo', 34);
INSERT INTO public.model VALUES (1432, 'Carisma', 34);
INSERT INTO public.model VALUES (1433, 'Celeste', 34);
INSERT INTO public.model VALUES (1434, 'Challenger', 34);
INSERT INTO public.model VALUES (1435, 'Chariot', 34);
INSERT INTO public.model VALUES (1436, 'Colt', 34);
INSERT INTO public.model VALUES (1437, 'Cordia', 34);
INSERT INTO public.model VALUES (1438, 'Debonair', 34);
INSERT INTO public.model VALUES (1439, 'Delica', 34);
INSERT INTO public.model VALUES (1440, 'Delica D:2', 34);
INSERT INTO public.model VALUES (1441, 'Delica D:3', 34);
INSERT INTO public.model VALUES (1442, 'Delica D:5', 34);
INSERT INTO public.model VALUES (1443, 'Diamante', 34);
INSERT INTO public.model VALUES (1444, 'Dignity', 34);
INSERT INTO public.model VALUES (1445, 'Dingo', 34);
INSERT INTO public.model VALUES (1446, 'Dion', 34);
INSERT INTO public.model VALUES (1447, 'Eclipse', 34);
INSERT INTO public.model VALUES (1448, 'Eclipse Cross', 34);
INSERT INTO public.model VALUES (1449, 'eK Active', 34);
INSERT INTO public.model VALUES (1450, 'eK Classic', 34);
INSERT INTO public.model VALUES (1451, 'eK Custom', 34);
INSERT INTO public.model VALUES (1452, 'eK Space', 34);
INSERT INTO public.model VALUES (1453, 'eK Sport', 34);
INSERT INTO public.model VALUES (1454, 'eK Wagon', 34);
INSERT INTO public.model VALUES (1455, 'Emeraude', 34);
INSERT INTO public.model VALUES (1456, 'Endeavor', 34);
INSERT INTO public.model VALUES (1457, 'Eterna', 34);
INSERT INTO public.model VALUES (1458, 'Freeca', 34);
INSERT INTO public.model VALUES (1459, 'FTO', 34);
INSERT INTO public.model VALUES (1460, 'Galant', 34);
INSERT INTO public.model VALUES (1461, 'Galant Fortis', 34);
INSERT INTO public.model VALUES (1462, 'Grandis', 34);
INSERT INTO public.model VALUES (1463, 'GTO', 34);
INSERT INTO public.model VALUES (1464, 'i', 34);
INSERT INTO public.model VALUES (1465, 'i-MiEV', 34);
INSERT INTO public.model VALUES (1466, 'Jeep J', 34);
INSERT INTO public.model VALUES (1467, 'L200', 34);
INSERT INTO public.model VALUES (1468, 'L300', 34);
INSERT INTO public.model VALUES (1469, 'L400', 34);
INSERT INTO public.model VALUES (1470, 'Lancer', 34);
INSERT INTO public.model VALUES (1471, 'Lancer Cargo', 34);
INSERT INTO public.model VALUES (1472, 'Lancer Evolution', 34);
INSERT INTO public.model VALUES (1473, 'Lancer Ralliart', 34);
INSERT INTO public.model VALUES (1474, 'Legnum', 34);
INSERT INTO public.model VALUES (1475, 'Libero', 34);
INSERT INTO public.model VALUES (1476, 'Minica', 34);
INSERT INTO public.model VALUES (1477, 'Minicab', 34);
INSERT INTO public.model VALUES (1478, 'Mirage', 34);
INSERT INTO public.model VALUES (1479, 'Montero', 34);
INSERT INTO public.model VALUES (1480, 'Montero Sport', 34);
INSERT INTO public.model VALUES (1481, 'Outlander', 34);
INSERT INTO public.model VALUES (1482, 'Outlander Sport', 34);
INSERT INTO public.model VALUES (1483, 'Pajero', 34);
INSERT INTO public.model VALUES (1484, 'Pajero iO', 34);
INSERT INTO public.model VALUES (1485, 'Pajero Junior', 34);
INSERT INTO public.model VALUES (1486, 'Pajero Mini', 34);
INSERT INTO public.model VALUES (1487, 'Pajero Pinin', 34);
INSERT INTO public.model VALUES (1488, 'Pajero Sport', 34);
INSERT INTO public.model VALUES (1489, 'Pistachio', 34);
INSERT INTO public.model VALUES (1490, 'Proudia', 34);
INSERT INTO public.model VALUES (1491, 'Raider', 34);
INSERT INTO public.model VALUES (1492, 'RVR', 34);
INSERT INTO public.model VALUES (1493, 'Sapporo', 34);
INSERT INTO public.model VALUES (1494, 'Savrin', 34);
INSERT INTO public.model VALUES (1495, 'Sigma', 34);
INSERT INTO public.model VALUES (1496, 'Space Gear', 34);
INSERT INTO public.model VALUES (1497, 'Space Runner', 34);
INSERT INTO public.model VALUES (1498, 'Space Star', 34);
INSERT INTO public.model VALUES (1499, 'Space Wagon', 34);
INSERT INTO public.model VALUES (1500, 'Starion', 34);
INSERT INTO public.model VALUES (1501, 'Strada', 34);
INSERT INTO public.model VALUES (1502, 'Toppo', 34);
INSERT INTO public.model VALUES (1503, 'Town Box', 34);
INSERT INTO public.model VALUES (1504, 'Tredia', 34);
INSERT INTO public.model VALUES (1505, 'Triton', 34);
INSERT INTO public.model VALUES (1506, 'Xpander', 34);
INSERT INTO public.model VALUES (1507, '100NX', 7);
INSERT INTO public.model VALUES (1508, '180SX', 7);
INSERT INTO public.model VALUES (1509, '200SX', 7);
INSERT INTO public.model VALUES (1510, '240SX', 7);
INSERT INTO public.model VALUES (1511, '280ZX', 7);
INSERT INTO public.model VALUES (1512, '300ZX', 7);
INSERT INTO public.model VALUES (1513, '350Z', 7);
INSERT INTO public.model VALUES (1514, '370Z', 7);
INSERT INTO public.model VALUES (1515, 'AD', 7);
INSERT INTO public.model VALUES (1516, 'Almera', 7);
INSERT INTO public.model VALUES (1517, 'Almera Classic', 7);
INSERT INTO public.model VALUES (1518, 'Almera Tino', 7);
INSERT INTO public.model VALUES (1519, 'Altima', 7);
INSERT INTO public.model VALUES (1520, 'Ariya', 7);
INSERT INTO public.model VALUES (1521, 'Armada', 7);
INSERT INTO public.model VALUES (1522, 'Auster', 7);
INSERT INTO public.model VALUES (1523, 'Avenir', 7);
INSERT INTO public.model VALUES (1524, 'Bassara', 7);
INSERT INTO public.model VALUES (1525, 'BE-1', 7);
INSERT INTO public.model VALUES (1526, 'Bluebird', 7);
INSERT INTO public.model VALUES (1527, 'Bluebird Maxima', 7);
INSERT INTO public.model VALUES (1528, 'Bluebird Sylphy', 7);
INSERT INTO public.model VALUES (1529, 'Caravan', 7);
INSERT INTO public.model VALUES (1530, 'Cedric', 7);
INSERT INTO public.model VALUES (1531, 'Cefiro', 7);
INSERT INTO public.model VALUES (1532, 'Cherry', 7);
INSERT INTO public.model VALUES (1533, 'Cima', 7);
INSERT INTO public.model VALUES (1534, 'Clipper Rio', 7);
INSERT INTO public.model VALUES (1535, 'Crew', 7);
INSERT INTO public.model VALUES (1536, 'Cube', 7);
INSERT INTO public.model VALUES (1537, 'Datsun', 7);
INSERT INTO public.model VALUES (1538, 'Dayz', 7);
INSERT INTO public.model VALUES (1539, 'Dayz Roox', 7);
INSERT INTO public.model VALUES (1540, 'Dualis', 7);
INSERT INTO public.model VALUES (1541, 'Elgrand', 7);
INSERT INTO public.model VALUES (1542, 'Exa', 7);
INSERT INTO public.model VALUES (1543, 'Expert', 7);
INSERT INTO public.model VALUES (1544, 'Fairlady Z', 7);
INSERT INTO public.model VALUES (1545, 'Figaro', 7);
INSERT INTO public.model VALUES (1546, 'Frontier', 7);
INSERT INTO public.model VALUES (1547, 'Fuga', 7);
INSERT INTO public.model VALUES (1548, 'Gloria', 7);
INSERT INTO public.model VALUES (1549, 'GT-R', 7);
INSERT INTO public.model VALUES (1550, 'Homy', 7);
INSERT INTO public.model VALUES (1551, 'Hypermini', 7);
INSERT INTO public.model VALUES (1552, 'Juke', 7);
INSERT INTO public.model VALUES (1553, 'Juke Nismo', 7);
INSERT INTO public.model VALUES (1554, 'Kicks', 7);
INSERT INTO public.model VALUES (1555, 'Kix', 7);
INSERT INTO public.model VALUES (1556, 'Lafesta', 7);
INSERT INTO public.model VALUES (1557, 'Langley', 7);
INSERT INTO public.model VALUES (1558, 'Lannia', 7);
INSERT INTO public.model VALUES (1559, 'Largo', 7);
INSERT INTO public.model VALUES (1560, 'Latio', 7);
INSERT INTO public.model VALUES (1561, 'Laurel', 7);
INSERT INTO public.model VALUES (1562, 'Leaf', 7);
INSERT INTO public.model VALUES (1563, 'Leopard', 7);
INSERT INTO public.model VALUES (1564, 'Liberta Villa', 7);
INSERT INTO public.model VALUES (1565, 'Liberty', 7);
INSERT INTO public.model VALUES (1566, 'Livina', 7);
INSERT INTO public.model VALUES (1567, 'Lucino', 7);
INSERT INTO public.model VALUES (1568, 'March', 7);
INSERT INTO public.model VALUES (1569, 'Maxima', 7);
INSERT INTO public.model VALUES (1570, 'Micra', 7);
INSERT INTO public.model VALUES (1571, 'Mistral', 7);
INSERT INTO public.model VALUES (1572, 'Moco', 7);
INSERT INTO public.model VALUES (1573, 'Murano', 7);
INSERT INTO public.model VALUES (1574, 'Navara', 7);
INSERT INTO public.model VALUES (1575, 'Note', 7);
INSERT INTO public.model VALUES (1576, 'NP300', 7);
INSERT INTO public.model VALUES (1577, 'NV100 Clipper', 7);
INSERT INTO public.model VALUES (1578, 'NV200', 7);
INSERT INTO public.model VALUES (1579, 'NV300', 7);
INSERT INTO public.model VALUES (1580, 'NV350 Caravan', 7);
INSERT INTO public.model VALUES (1581, 'NX Coupe', 7);
INSERT INTO public.model VALUES (1582, 'Otti', 7);
INSERT INTO public.model VALUES (1583, 'Pao', 7);
INSERT INTO public.model VALUES (1584, 'Pathfinder', 7);
INSERT INTO public.model VALUES (1585, 'Patrol', 7);
INSERT INTO public.model VALUES (1586, 'Pino', 7);
INSERT INTO public.model VALUES (1587, 'Pixo', 7);
INSERT INTO public.model VALUES (1588, 'Prairie', 7);
INSERT INTO public.model VALUES (1589, 'Presage', 7);
INSERT INTO public.model VALUES (1590, 'Presea', 7);
INSERT INTO public.model VALUES (1591, 'President', 7);
INSERT INTO public.model VALUES (1592, 'Primastar', 7);
INSERT INTO public.model VALUES (1593, 'Primera', 7);
INSERT INTO public.model VALUES (1594, 'Pulsar', 7);
INSERT INTO public.model VALUES (1595, 'Qashqai', 7);
INSERT INTO public.model VALUES (1596, 'Qashqai+2', 7);
INSERT INTO public.model VALUES (1597, 'Quest', 7);
INSERT INTO public.model VALUES (1598, 'R nessa', 7);
INSERT INTO public.model VALUES (1599, 'Rasheen', 7);
INSERT INTO public.model VALUES (1600, 'Rogue', 7);
INSERT INTO public.model VALUES (1601, 'Rogue Sport', 7);
INSERT INTO public.model VALUES (1602, 'Roox', 7);
INSERT INTO public.model VALUES (1603, 'Safari', 7);
INSERT INTO public.model VALUES (1604, 'Sentra', 7);
INSERT INTO public.model VALUES (1605, 'Serena', 7);
INSERT INTO public.model VALUES (1606, 'Silvia', 7);
INSERT INTO public.model VALUES (1607, 'Skyline', 7);
INSERT INTO public.model VALUES (1608, 'Skyline Crossover', 7);
INSERT INTO public.model VALUES (1609, 'Stagea', 7);
INSERT INTO public.model VALUES (1610, 'Stanza', 7);
INSERT INTO public.model VALUES (1611, 'Sunny', 7);
INSERT INTO public.model VALUES (1612, 'Sylphy', 7);
INSERT INTO public.model VALUES (1613, 'Teana', 7);
INSERT INTO public.model VALUES (1614, 'Terra', 7);
INSERT INTO public.model VALUES (1615, 'Terrano', 7);
INSERT INTO public.model VALUES (1616, 'Terrano Regulus', 7);
INSERT INTO public.model VALUES (1617, 'Tiida', 7);
INSERT INTO public.model VALUES (1618, 'Tino', 7);
INSERT INTO public.model VALUES (1619, 'Titan', 7);
INSERT INTO public.model VALUES (1620, 'Urvan', 7);
INSERT INTO public.model VALUES (1621, 'Vanette', 7);
INSERT INTO public.model VALUES (1622, 'Versa', 7);
INSERT INTO public.model VALUES (1623, 'Versa Note', 7);
INSERT INTO public.model VALUES (1624, 'Wingroad', 7);
INSERT INTO public.model VALUES (1625, 'X-Terra', 7);
INSERT INTO public.model VALUES (1626, 'X-Trail', 7);
INSERT INTO public.model VALUES (1627, 'Xterra', 7);
INSERT INTO public.model VALUES (1628, 'Z', 7);
INSERT INTO public.model VALUES (1629, '4 PS', 31);
INSERT INTO public.model VALUES (1630, '8 PS', 31);
INSERT INTO public.model VALUES (1631, 'Adam', 31);
INSERT INTO public.model VALUES (1632, 'Admiral', 31);
INSERT INTO public.model VALUES (1633, 'Agila', 31);
INSERT INTO public.model VALUES (1634, 'Ampera', 31);
INSERT INTO public.model VALUES (1635, 'Antara', 31);
INSERT INTO public.model VALUES (1636, 'Ascona', 31);
INSERT INTO public.model VALUES (1637, 'Astra', 31);
INSERT INTO public.model VALUES (1638, 'Astra OPC', 31);
INSERT INTO public.model VALUES (1639, 'Calibra', 31);
INSERT INTO public.model VALUES (1640, 'Campo', 31);
INSERT INTO public.model VALUES (1641, 'Cascada', 31);
INSERT INTO public.model VALUES (1642, 'Combo', 31);
INSERT INTO public.model VALUES (1643, 'Commodore', 31);
INSERT INTO public.model VALUES (1644, 'Corsa', 31);
INSERT INTO public.model VALUES (1645, 'Corsa OPC', 31);
INSERT INTO public.model VALUES (1646, 'Crossland X', 31);
INSERT INTO public.model VALUES (1647, 'Diplomat', 31);
INSERT INTO public.model VALUES (1648, 'Frontera', 31);
INSERT INTO public.model VALUES (1649, 'Grandland X', 31);
INSERT INTO public.model VALUES (1650, 'GT', 31);
INSERT INTO public.model VALUES (1651, 'Insignia', 31);
INSERT INTO public.model VALUES (1652, 'Insignia OPC', 31);
INSERT INTO public.model VALUES (1653, 'Kadett', 31);
INSERT INTO public.model VALUES (1654, 'Kapitan', 31);
INSERT INTO public.model VALUES (1655, 'Karl', 31);
INSERT INTO public.model VALUES (1656, 'Manta', 31);
INSERT INTO public.model VALUES (1657, 'Meriva', 31);
INSERT INTO public.model VALUES (1658, 'Meriva OPC', 31);
INSERT INTO public.model VALUES (1659, 'Mokka', 31);
INSERT INTO public.model VALUES (1660, 'Monterey', 31);
INSERT INTO public.model VALUES (1661, 'Monza', 31);
INSERT INTO public.model VALUES (1662, 'Olympia', 31);
INSERT INTO public.model VALUES (1663, 'Omega', 31);
INSERT INTO public.model VALUES (1664, 'P4', 31);
INSERT INTO public.model VALUES (1665, 'Rekord', 31);
INSERT INTO public.model VALUES (1666, 'Senator', 31);
INSERT INTO public.model VALUES (1667, 'Signum', 31);
INSERT INTO public.model VALUES (1668, 'Sintra', 31);
INSERT INTO public.model VALUES (1669, 'Speedster', 31);
INSERT INTO public.model VALUES (1670, 'Super Six', 31);
INSERT INTO public.model VALUES (1671, 'Tigra', 31);
INSERT INTO public.model VALUES (1672, 'Vectra', 31);
INSERT INTO public.model VALUES (1673, 'Vectra OPC', 31);
INSERT INTO public.model VALUES (1674, 'Vita', 31);
INSERT INTO public.model VALUES (1675, 'Vivaro', 31);
INSERT INTO public.model VALUES (1676, 'Zafira', 31);
INSERT INTO public.model VALUES (1677, 'Zafira Life', 31);
INSERT INTO public.model VALUES (1678, 'Zafira OPC', 31);
INSERT INTO public.model VALUES (1679, '1007', 35);
INSERT INTO public.model VALUES (1680, '104', 35);
INSERT INTO public.model VALUES (1681, '106', 35);
INSERT INTO public.model VALUES (1682, '107', 35);
INSERT INTO public.model VALUES (1683, '108', 35);
INSERT INTO public.model VALUES (1684, '2008', 35);
INSERT INTO public.model VALUES (1685, '201', 35);
INSERT INTO public.model VALUES (1686, '202', 35);
INSERT INTO public.model VALUES (1687, '203', 35);
INSERT INTO public.model VALUES (1688, '204', 35);
INSERT INTO public.model VALUES (1689, '205', 35);
INSERT INTO public.model VALUES (1690, '205 GTi', 35);
INSERT INTO public.model VALUES (1691, '206', 35);
INSERT INTO public.model VALUES (1692, '207', 35);
INSERT INTO public.model VALUES (1693, '207i', 35);
INSERT INTO public.model VALUES (1694, '208', 35);
INSERT INTO public.model VALUES (1695, '208 GTi', 35);
INSERT INTO public.model VALUES (1696, '3008', 35);
INSERT INTO public.model VALUES (1697, '301', 35);
INSERT INTO public.model VALUES (1698, '304', 35);
INSERT INTO public.model VALUES (1699, '305', 35);
INSERT INTO public.model VALUES (1700, '306', 35);
INSERT INTO public.model VALUES (1701, '307', 35);
INSERT INTO public.model VALUES (1702, '308', 35);
INSERT INTO public.model VALUES (1703, '308 GTi', 35);
INSERT INTO public.model VALUES (1704, '309', 35);
INSERT INTO public.model VALUES (1705, '4007', 35);
INSERT INTO public.model VALUES (1706, '4008', 35);
INSERT INTO public.model VALUES (1707, '402', 35);
INSERT INTO public.model VALUES (1708, '403', 35);
INSERT INTO public.model VALUES (1709, '404', 35);
INSERT INTO public.model VALUES (1710, '405', 35);
INSERT INTO public.model VALUES (1711, '406', 35);
INSERT INTO public.model VALUES (1712, '407', 35);
INSERT INTO public.model VALUES (1713, '408', 35);
INSERT INTO public.model VALUES (1714, '5008', 35);
INSERT INTO public.model VALUES (1715, '504', 35);
INSERT INTO public.model VALUES (1716, '505', 35);
INSERT INTO public.model VALUES (1717, '508', 35);
INSERT INTO public.model VALUES (1718, '604', 35);
INSERT INTO public.model VALUES (1719, '605', 35);
INSERT INTO public.model VALUES (1720, '607', 35);
INSERT INTO public.model VALUES (1721, '806', 35);
INSERT INTO public.model VALUES (1722, '807', 35);
INSERT INTO public.model VALUES (1723, 'Bipper', 35);
INSERT INTO public.model VALUES (1724, 'Expert', 35);
INSERT INTO public.model VALUES (1725, 'iOn', 35);
INSERT INTO public.model VALUES (1726, 'Partner', 35);
INSERT INTO public.model VALUES (1727, 'Pick Up', 35);
INSERT INTO public.model VALUES (1728, 'RCZ', 35);
INSERT INTO public.model VALUES (1729, 'Rifter', 35);
INSERT INTO public.model VALUES (1730, 'Traveller', 35);
INSERT INTO public.model VALUES (1731, '356', 56);
INSERT INTO public.model VALUES (1732, '718 Spyder', 56);
INSERT INTO public.model VALUES (1733, '911', 56);
INSERT INTO public.model VALUES (1734, '911 GT2', 56);
INSERT INTO public.model VALUES (1735, '911 GT3', 56);
INSERT INTO public.model VALUES (1736, '911 R', 56);
INSERT INTO public.model VALUES (1737, '911 S/T', 56);
INSERT INTO public.model VALUES (1738, '912', 56);
INSERT INTO public.model VALUES (1739, '914', 56);
INSERT INTO public.model VALUES (1740, '918 Spyder', 56);
INSERT INTO public.model VALUES (1741, '924', 56);
INSERT INTO public.model VALUES (1742, '928', 56);
INSERT INTO public.model VALUES (1743, '944', 56);
INSERT INTO public.model VALUES (1744, '959', 56);
INSERT INTO public.model VALUES (1745, '968', 56);
INSERT INTO public.model VALUES (1746, 'Boxster', 56);
INSERT INTO public.model VALUES (1747, 'Carrera GT', 56);
INSERT INTO public.model VALUES (1748, 'Cayenne', 56);
INSERT INTO public.model VALUES (1749, 'Cayman', 56);
INSERT INTO public.model VALUES (1750, 'Cayman GT4', 56);
INSERT INTO public.model VALUES (1751, 'Macan', 56);
INSERT INTO public.model VALUES (1752, 'Panamera', 56);
INSERT INTO public.model VALUES (1753, 'Taycan', 56);
INSERT INTO public.model VALUES (1754, '10', 32);
INSERT INTO public.model VALUES (1755, '11', 32);
INSERT INTO public.model VALUES (1756, '12', 32);
INSERT INTO public.model VALUES (1757, '14', 32);
INSERT INTO public.model VALUES (1758, '15', 32);
INSERT INTO public.model VALUES (1759, '16', 32);
INSERT INTO public.model VALUES (1760, '17', 32);
INSERT INTO public.model VALUES (1761, '18', 32);
INSERT INTO public.model VALUES (1762, '19', 32);
INSERT INTO public.model VALUES (1763, '20', 32);
INSERT INTO public.model VALUES (1764, '21', 32);
INSERT INTO public.model VALUES (1765, '25', 32);
INSERT INTO public.model VALUES (1766, '30', 32);
INSERT INTO public.model VALUES (1767, '4', 32);
INSERT INTO public.model VALUES (1768, '4CV', 32);
INSERT INTO public.model VALUES (1769, '5', 32);
INSERT INTO public.model VALUES (1770, '6', 32);
INSERT INTO public.model VALUES (1771, '8', 32);
INSERT INTO public.model VALUES (1772, '9', 32);
INSERT INTO public.model VALUES (1773, 'Alaskan', 32);
INSERT INTO public.model VALUES (1774, 'Arkana', 32);
INSERT INTO public.model VALUES (1775, 'Austral', 32);
INSERT INTO public.model VALUES (1776, 'Avantime', 32);
INSERT INTO public.model VALUES (1777, 'Captur', 32);
INSERT INTO public.model VALUES (1778, 'Caravelle', 32);
INSERT INTO public.model VALUES (1779, 'City K-ZE', 32);
INSERT INTO public.model VALUES (1780, 'Clio', 32);
INSERT INTO public.model VALUES (1781, 'Clio RS', 32);
INSERT INTO public.model VALUES (1782, 'Clio V6', 32);
INSERT INTO public.model VALUES (1783, 'Dauphine', 32);
INSERT INTO public.model VALUES (1784, 'Dokker', 32);
INSERT INTO public.model VALUES (1785, 'Duster', 32);
INSERT INTO public.model VALUES (1786, 'Espace', 32);
INSERT INTO public.model VALUES (1787, 'Express', 32);
INSERT INTO public.model VALUES (1788, 'Floride', 32);
INSERT INTO public.model VALUES (1789, 'Fluence', 32);
INSERT INTO public.model VALUES (1790, 'Fregate', 32);
INSERT INTO public.model VALUES (1791, 'Fuego', 32);
INSERT INTO public.model VALUES (1792, 'Kadjar', 32);
INSERT INTO public.model VALUES (1793, 'Kangoo', 32);
INSERT INTO public.model VALUES (1794, 'Kaptur', 32);
INSERT INTO public.model VALUES (1795, 'Kardian', 32);
INSERT INTO public.model VALUES (1796, 'Koleos', 32);
INSERT INTO public.model VALUES (1797, 'KWID', 32);
INSERT INTO public.model VALUES (1798, 'Laguna', 32);
INSERT INTO public.model VALUES (1799, 'Latitude', 32);
INSERT INTO public.model VALUES (1800, 'Lodgy', 32);
INSERT INTO public.model VALUES (1801, 'Logan', 32);
INSERT INTO public.model VALUES (1802, 'Megane', 32);
INSERT INTO public.model VALUES (1803, 'Megane E-Tech', 32);
INSERT INTO public.model VALUES (1804, 'Megane RS', 32);
INSERT INTO public.model VALUES (1805, 'Modus', 32);
INSERT INTO public.model VALUES (1806, 'Rafale', 32);
INSERT INTO public.model VALUES (1807, 'Rodeo', 32);
INSERT INTO public.model VALUES (1808, 'Safrane', 32);
INSERT INTO public.model VALUES (1809, 'Sandero', 32);
INSERT INTO public.model VALUES (1810, 'Sandero RS', 32);
INSERT INTO public.model VALUES (1811, 'Scenic', 32);
INSERT INTO public.model VALUES (1812, 'Sport Spider', 32);
INSERT INTO public.model VALUES (1813, 'Symbol', 32);
INSERT INTO public.model VALUES (1814, 'Talisman', 32);
INSERT INTO public.model VALUES (1815, 'Trafic', 32);
INSERT INTO public.model VALUES (1816, 'Twingo', 32);
INSERT INTO public.model VALUES (1817, 'Twizy', 32);
INSERT INTO public.model VALUES (1818, 'Vel Satis', 32);
INSERT INTO public.model VALUES (1819, 'Vivastella', 32);
INSERT INTO public.model VALUES (1820, 'Wind', 32);
INSERT INTO public.model VALUES (1821, 'ZOE', 32);
INSERT INTO public.model VALUES (1822, '20', 66);
INSERT INTO public.model VALUES (1823, '20/25', 66);
INSERT INTO public.model VALUES (1824, 'Camargue', 66);
INSERT INTO public.model VALUES (1825, 'Corniche', 66);
INSERT INTO public.model VALUES (1826, 'Cullinan', 66);
INSERT INTO public.model VALUES (1827, 'Dawn', 66);
INSERT INTO public.model VALUES (1828, 'Ghost', 66);
INSERT INTO public.model VALUES (1829, 'Park Ward', 66);
INSERT INTO public.model VALUES (1830, 'Phantom', 66);
INSERT INTO public.model VALUES (1831, 'Silver Cloud', 66);
INSERT INTO public.model VALUES (1832, 'Silver Ghost', 66);
INSERT INTO public.model VALUES (1833, 'Silver Seraph', 66);
INSERT INTO public.model VALUES (1834, 'Silver Shadow', 66);
INSERT INTO public.model VALUES (1835, 'Silver Spirit', 66);
INSERT INTO public.model VALUES (1836, 'Silver Spur', 66);
INSERT INTO public.model VALUES (1837, 'Silver Wraith', 66);
INSERT INTO public.model VALUES (1838, 'Spectre', 66);
INSERT INTO public.model VALUES (1839, 'Wraith', 66);
INSERT INTO public.model VALUES (1840, '100 Series', 4);
INSERT INTO public.model VALUES (1841, '1200', 4);
INSERT INTO public.model VALUES (1842, 'Citigo', 4);
INSERT INTO public.model VALUES (1843, 'Enyaq', 4);
INSERT INTO public.model VALUES (1844, 'Enyaq Coupe', 4);
INSERT INTO public.model VALUES (1845, 'Enyaq Coupe RS', 4);
INSERT INTO public.model VALUES (1846, 'Enyaq RS', 4);
INSERT INTO public.model VALUES (1847, 'Fabia', 4);
INSERT INTO public.model VALUES (1848, 'Fabia RS', 4);
INSERT INTO public.model VALUES (1849, 'Favorit', 4);
INSERT INTO public.model VALUES (1850, 'Felicia', 4);
INSERT INTO public.model VALUES (1851, 'Forman', 4);
INSERT INTO public.model VALUES (1852, 'Kamiq', 4);
INSERT INTO public.model VALUES (1853, 'Karoq', 4);
INSERT INTO public.model VALUES (1854, 'Kodiaq', 4);
INSERT INTO public.model VALUES (1855, 'Kodiaq GT', 4);
INSERT INTO public.model VALUES (1856, 'Kodiaq RS', 4);
INSERT INTO public.model VALUES (1857, 'Octavia', 4);
INSERT INTO public.model VALUES (1858, 'Octavia RS', 4);
INSERT INTO public.model VALUES (1859, 'Popular', 4);
INSERT INTO public.model VALUES (1860, 'Rapid', 4);
INSERT INTO public.model VALUES (1861, 'Roomster', 4);
INSERT INTO public.model VALUES (1862, 'Scala', 4);
INSERT INTO public.model VALUES (1863, 'Superb', 4);
INSERT INTO public.model VALUES (1864, 'Yeti', 4);
INSERT INTO public.model VALUES (1865, '1000', 8);
INSERT INTO public.model VALUES (1866, '360', 8);
INSERT INTO public.model VALUES (1867, 'Alcyone', 8);
INSERT INTO public.model VALUES (1868, 'Ascent', 8);
INSERT INTO public.model VALUES (1869, 'Baja', 8);
INSERT INTO public.model VALUES (1870, 'Bighorn', 8);
INSERT INTO public.model VALUES (1871, 'Bistro', 8);
INSERT INTO public.model VALUES (1872, 'Brat', 8);
INSERT INTO public.model VALUES (1873, 'BRZ', 8);
INSERT INTO public.model VALUES (1874, 'Chiffon', 8);
INSERT INTO public.model VALUES (1875, 'Crosstrek', 8);
INSERT INTO public.model VALUES (1876, 'Dex', 8);
INSERT INTO public.model VALUES (1877, 'Dias Wagon', 8);
INSERT INTO public.model VALUES (1878, 'Domingo', 8);
INSERT INTO public.model VALUES (1879, 'Exiga', 8);
INSERT INTO public.model VALUES (1880, 'Forester', 8);
INSERT INTO public.model VALUES (1881, 'Impreza', 8);
INSERT INTO public.model VALUES (1882, 'Impreza WRX', 8);
INSERT INTO public.model VALUES (1883, 'Impreza WRX STi', 8);
INSERT INTO public.model VALUES (1884, 'Justy', 8);
INSERT INTO public.model VALUES (1885, 'Legacy', 8);
INSERT INTO public.model VALUES (1886, 'Legacy Lancaster', 8);
INSERT INTO public.model VALUES (1887, 'Leone', 8);
INSERT INTO public.model VALUES (1888, 'Levorg', 8);
INSERT INTO public.model VALUES (1889, 'Libero', 8);
INSERT INTO public.model VALUES (1890, 'Lucra', 8);
INSERT INTO public.model VALUES (1891, 'Outback', 8);
INSERT INTO public.model VALUES (1892, 'Pleo', 8);
INSERT INTO public.model VALUES (1893, 'Pleo Plus', 8);
INSERT INTO public.model VALUES (1894, 'R1', 8);
INSERT INTO public.model VALUES (1895, 'R2', 8);
INSERT INTO public.model VALUES (1896, 'Rex', 8);
INSERT INTO public.model VALUES (1897, 'Sambar', 8);
INSERT INTO public.model VALUES (1898, 'Solterra', 8);
INSERT INTO public.model VALUES (1899, 'Stella', 8);
INSERT INTO public.model VALUES (1900, 'SVX', 8);
INSERT INTO public.model VALUES (1901, 'Traviq', 8);
INSERT INTO public.model VALUES (1902, 'Trezia', 8);
INSERT INTO public.model VALUES (1903, 'Tribeca', 8);
INSERT INTO public.model VALUES (1904, 'Vivio', 8);
INSERT INTO public.model VALUES (1905, 'WRX', 8);
INSERT INTO public.model VALUES (1906, 'WRX STi', 8);
INSERT INTO public.model VALUES (1907, 'XT', 8);
INSERT INTO public.model VALUES (1908, 'XV', 8);
INSERT INTO public.model VALUES (1909, 'Across', 29);
INSERT INTO public.model VALUES (1910, 'Aerio', 29);
INSERT INTO public.model VALUES (1911, 'Alto', 29);
INSERT INTO public.model VALUES (1912, 'Alto Lapin', 29);
INSERT INTO public.model VALUES (1913, 'APV', 29);
INSERT INTO public.model VALUES (1914, 'Baleno', 29);
INSERT INTO public.model VALUES (1915, 'Cappuccino', 29);
INSERT INTO public.model VALUES (1916, 'Cara', 29);
INSERT INTO public.model VALUES (1917, 'Carry', 29);
INSERT INTO public.model VALUES (1918, 'Celerio', 29);
INSERT INTO public.model VALUES (1919, 'Cervo', 29);
INSERT INTO public.model VALUES (1920, 'Ciaz', 29);
INSERT INTO public.model VALUES (1921, 'Cultus', 29);
INSERT INTO public.model VALUES (1922, 'DZire', 29);
INSERT INTO public.model VALUES (1923, 'Eeco', 29);
INSERT INTO public.model VALUES (1924, 'Equator', 29);
INSERT INTO public.model VALUES (1925, 'Ertiga', 29);
INSERT INTO public.model VALUES (1926, 'Escudo', 29);
INSERT INTO public.model VALUES (1927, 'Esteem', 29);
INSERT INTO public.model VALUES (1928, 'Every', 29);
INSERT INTO public.model VALUES (1929, 'Forenza', 29);
INSERT INTO public.model VALUES (1930, 'Fronte', 29);
INSERT INTO public.model VALUES (1931, 'Fronx', 29);
INSERT INTO public.model VALUES (1932, 'Grand Vitara', 29);
INSERT INTO public.model VALUES (1933, 'Hustler', 29);
INSERT INTO public.model VALUES (1934, 'Ignis', 29);
INSERT INTO public.model VALUES (1935, 'Jimny', 29);
INSERT INTO public.model VALUES (1936, 'Kei', 29);
INSERT INTO public.model VALUES (1937, 'Kizashi', 29);
INSERT INTO public.model VALUES (1938, 'Landy', 29);
INSERT INTO public.model VALUES (1939, 'Liana', 29);
INSERT INTO public.model VALUES (1940, 'MR Wagon', 29);
INSERT INTO public.model VALUES (1941, 'Palette', 29);
INSERT INTO public.model VALUES (1942, 'Reno', 29);
INSERT INTO public.model VALUES (1943, 'S-Presso', 29);
INSERT INTO public.model VALUES (1944, 'Samurai', 29);
INSERT INTO public.model VALUES (1945, 'Sidekick', 29);
INSERT INTO public.model VALUES (1946, 'Solio', 29);
INSERT INTO public.model VALUES (1947, 'Spacia', 29);
INSERT INTO public.model VALUES (1948, 'Splash', 29);
INSERT INTO public.model VALUES (1949, 'Swace', 29);
INSERT INTO public.model VALUES (1950, 'Swift', 29);
INSERT INTO public.model VALUES (1951, 'SX4', 29);
INSERT INTO public.model VALUES (1952, 'Twin', 29);
INSERT INTO public.model VALUES (1953, 'Verona', 29);
INSERT INTO public.model VALUES (1954, 'Vitara', 29);
INSERT INTO public.model VALUES (1955, 'Wagon R', 29);
INSERT INTO public.model VALUES (1956, 'Wagon R+', 29);
INSERT INTO public.model VALUES (1957, 'X-90', 29);
INSERT INTO public.model VALUES (1958, 'Xbee', 29);
INSERT INTO public.model VALUES (1959, 'XL7', 29);
INSERT INTO public.model VALUES (1960, '300', 58);
INSERT INTO public.model VALUES (1961, '400', 58);
INSERT INTO public.model VALUES (1962, '500', 58);
INSERT INTO public.model VALUES (1963, 'Cybertruck', 59);
INSERT INTO public.model VALUES (1964, 'Model 3', 59);
INSERT INTO public.model VALUES (1965, 'Model S', 59);
INSERT INTO public.model VALUES (1966, 'Model X', 59);
INSERT INTO public.model VALUES (1967, 'Model Y', 59);
INSERT INTO public.model VALUES (1968, 'Roadster', 59);
INSERT INTO public.model VALUES (1969, '2000GT', 6);
INSERT INTO public.model VALUES (1970, '4Runner', 6);
INSERT INTO public.model VALUES (1971, 'Allex', 6);
INSERT INTO public.model VALUES (1972, 'Allion', 6);
INSERT INTO public.model VALUES (1973, 'Alphard', 6);
INSERT INTO public.model VALUES (1974, 'Altezza', 6);
INSERT INTO public.model VALUES (1975, 'Aqua', 6);
INSERT INTO public.model VALUES (1976, 'Aristo', 6);
INSERT INTO public.model VALUES (1977, 'Aurion', 6);
INSERT INTO public.model VALUES (1978, 'Auris', 6);
INSERT INTO public.model VALUES (1979, 'Avalon', 6);
INSERT INTO public.model VALUES (1980, 'Avanza', 6);
INSERT INTO public.model VALUES (1981, 'Avensis', 6);
INSERT INTO public.model VALUES (1982, 'Avensis Verso', 6);
INSERT INTO public.model VALUES (1983, 'Aygo', 6);
INSERT INTO public.model VALUES (1984, 'Aygo X', 6);
INSERT INTO public.model VALUES (1985, 'bB', 6);
INSERT INTO public.model VALUES (1986, 'Belta', 6);
INSERT INTO public.model VALUES (1987, 'Blade', 6);
INSERT INTO public.model VALUES (1988, 'Blizzard', 6);
INSERT INTO public.model VALUES (1989, 'Brevis', 6);
INSERT INTO public.model VALUES (1990, 'bZ3', 6);
INSERT INTO public.model VALUES (1991, 'bZ4X', 6);
INSERT INTO public.model VALUES (1992, 'C-HR', 6);
INSERT INTO public.model VALUES (1993, 'Caldina', 6);
INSERT INTO public.model VALUES (1994, 'Cami', 6);
INSERT INTO public.model VALUES (1995, 'Camry', 6);
INSERT INTO public.model VALUES (1996, 'Camry Solara', 6);
INSERT INTO public.model VALUES (1997, 'Carina', 6);
INSERT INTO public.model VALUES (1998, 'Carina E', 6);
INSERT INTO public.model VALUES (1999, 'Carina ED', 6);
INSERT INTO public.model VALUES (2000, 'Cavalier', 6);
INSERT INTO public.model VALUES (2001, 'Celica', 6);
INSERT INTO public.model VALUES (2002, 'Celsior', 6);
INSERT INTO public.model VALUES (2003, 'Century', 6);
INSERT INTO public.model VALUES (2004, 'Chaser', 6);
INSERT INTO public.model VALUES (2005, 'Classic', 6);
INSERT INTO public.model VALUES (2006, 'Comfort', 6);
INSERT INTO public.model VALUES (2007, 'COMS', 6);
INSERT INTO public.model VALUES (2008, 'Corolla', 6);
INSERT INTO public.model VALUES (2009, 'Corolla Cross', 6);
INSERT INTO public.model VALUES (2010, 'Corolla II', 6);
INSERT INTO public.model VALUES (2011, 'Corolla Levin', 6);
INSERT INTO public.model VALUES (2012, 'Corolla Rumion', 6);
INSERT INTO public.model VALUES (2013, 'Corolla Spacio', 6);
INSERT INTO public.model VALUES (2014, 'Corolla Verso', 6);
INSERT INTO public.model VALUES (2015, 'Corona', 6);
INSERT INTO public.model VALUES (2016, 'Corona EXiV', 6);
INSERT INTO public.model VALUES (2017, 'Corsa', 6);
INSERT INTO public.model VALUES (2018, 'Cressida', 6);
INSERT INTO public.model VALUES (2019, 'Cresta', 6);
INSERT INTO public.model VALUES (2020, 'Crown', 6);
INSERT INTO public.model VALUES (2021, 'Crown Kluger', 6);
INSERT INTO public.model VALUES (2022, 'Crown Majesta', 6);
INSERT INTO public.model VALUES (2023, 'Curren', 6);
INSERT INTO public.model VALUES (2024, 'Cynos', 6);
INSERT INTO public.model VALUES (2025, 'Duet', 6);
INSERT INTO public.model VALUES (2026, 'Echo', 6);
INSERT INTO public.model VALUES (2027, 'Esquire', 6);
INSERT INTO public.model VALUES (2028, 'Estima', 6);
INSERT INTO public.model VALUES (2029, 'Etios', 6);
INSERT INTO public.model VALUES (2030, 'FJ Cruiser', 6);
INSERT INTO public.model VALUES (2031, 'Fortuner', 6);
INSERT INTO public.model VALUES (2032, 'Frontlander', 6);
INSERT INTO public.model VALUES (2033, 'FunCargo', 6);
INSERT INTO public.model VALUES (2034, 'Gaia', 6);
INSERT INTO public.model VALUES (2035, 'GR86', 6);
INSERT INTO public.model VALUES (2036, 'Grand HiAce', 6);
INSERT INTO public.model VALUES (2037, 'Grand Highlander', 6);
INSERT INTO public.model VALUES (2038, 'Granvia', 6);
INSERT INTO public.model VALUES (2039, 'GT86', 6);
INSERT INTO public.model VALUES (2040, 'Harrier', 6);
INSERT INTO public.model VALUES (2041, 'HiAce', 6);
INSERT INTO public.model VALUES (2042, 'Highlander', 6);
INSERT INTO public.model VALUES (2043, 'Hilux', 6);
INSERT INTO public.model VALUES (2044, 'Hilux Surf', 6);
INSERT INTO public.model VALUES (2045, 'Innova', 6);
INSERT INTO public.model VALUES (2046, 'Ipsum', 6);
INSERT INTO public.model VALUES (2047, 'iQ', 6);
INSERT INTO public.model VALUES (2048, 'ISis', 6);
INSERT INTO public.model VALUES (2049, 'Ist', 6);
INSERT INTO public.model VALUES (2050, 'Izoa', 6);
INSERT INTO public.model VALUES (2051, 'Kluger', 6);
INSERT INTO public.model VALUES (2052, 'Land Cruiser', 6);
INSERT INTO public.model VALUES (2053, 'Land Cruiser Prado', 6);
INSERT INTO public.model VALUES (2054, 'Levin', 6);
INSERT INTO public.model VALUES (2055, 'Lite Ace', 6);
INSERT INTO public.model VALUES (2056, 'Mark II', 6);
INSERT INTO public.model VALUES (2057, 'Mark X', 6);
INSERT INTO public.model VALUES (2058, 'Mark X ZiO', 6);
INSERT INTO public.model VALUES (2059, 'MasterAce Surf', 6);
INSERT INTO public.model VALUES (2060, 'Matrix', 6);
INSERT INTO public.model VALUES (2061, 'Mega Cruiser', 6);
INSERT INTO public.model VALUES (2062, 'Mirai', 6);
INSERT INTO public.model VALUES (2063, 'Model F', 6);
INSERT INTO public.model VALUES (2064, 'MR-S', 6);
INSERT INTO public.model VALUES (2065, 'MR2', 6);
INSERT INTO public.model VALUES (2066, 'Nadia', 6);
INSERT INTO public.model VALUES (2067, 'Noah', 6);
INSERT INTO public.model VALUES (2068, 'Opa', 6);
INSERT INTO public.model VALUES (2069, 'Origin', 6);
INSERT INTO public.model VALUES (2070, 'Paseo', 6);
INSERT INTO public.model VALUES (2071, 'Passo', 6);
INSERT INTO public.model VALUES (2072, 'Passo Sette', 6);
INSERT INTO public.model VALUES (2073, 'Picnic', 6);
INSERT INTO public.model VALUES (2074, 'Pixis Epoch', 6);
INSERT INTO public.model VALUES (2075, 'Pixis Joy', 6);
INSERT INTO public.model VALUES (2076, 'Pixis Mega', 6);
INSERT INTO public.model VALUES (2077, 'Pixis Space', 6);
INSERT INTO public.model VALUES (2078, 'Pixis Van', 6);
INSERT INTO public.model VALUES (2079, 'Platz', 6);
INSERT INTO public.model VALUES (2080, 'Porte', 6);
INSERT INTO public.model VALUES (2081, 'Premio', 6);
INSERT INTO public.model VALUES (2082, 'Previa', 6);
INSERT INTO public.model VALUES (2083, 'Prius', 6);
INSERT INTO public.model VALUES (2084, 'Prius Alpha', 6);
INSERT INTO public.model VALUES (2085, 'Prius c', 6);
INSERT INTO public.model VALUES (2086, 'Prius v (+)', 6);
INSERT INTO public.model VALUES (2087, 'ProAce', 6);
INSERT INTO public.model VALUES (2088, 'ProAce City', 6);
INSERT INTO public.model VALUES (2089, 'Probox', 6);
INSERT INTO public.model VALUES (2090, 'Progres', 6);
INSERT INTO public.model VALUES (2091, 'Pronard', 6);
INSERT INTO public.model VALUES (2092, 'Publica', 6);
INSERT INTO public.model VALUES (2093, 'Ractis', 6);
INSERT INTO public.model VALUES (2094, 'Raize', 6);
INSERT INTO public.model VALUES (2095, 'Raum', 6);
INSERT INTO public.model VALUES (2096, 'RAV4', 6);
INSERT INTO public.model VALUES (2097, 'Regius', 6);
INSERT INTO public.model VALUES (2098, 'RegiusAce', 6);
INSERT INTO public.model VALUES (2099, 'Roomy', 6);
INSERT INTO public.model VALUES (2100, 'Rush', 6);
INSERT INTO public.model VALUES (2101, 'Sai', 6);
INSERT INTO public.model VALUES (2102, 'Scepter', 6);
INSERT INTO public.model VALUES (2103, 'Sequoia', 6);
INSERT INTO public.model VALUES (2104, 'Sera', 6);
INSERT INTO public.model VALUES (2105, 'Sienna', 6);
INSERT INTO public.model VALUES (2106, 'Sienta', 6);
INSERT INTO public.model VALUES (2107, 'Soarer', 6);
INSERT INTO public.model VALUES (2108, 'Soluna', 6);
INSERT INTO public.model VALUES (2109, 'Spade', 6);
INSERT INTO public.model VALUES (2110, 'Sparky', 6);
INSERT INTO public.model VALUES (2111, 'Sports 800', 6);
INSERT INTO public.model VALUES (2112, 'Sprinter', 6);
INSERT INTO public.model VALUES (2113, 'Sprinter Carib', 6);
INSERT INTO public.model VALUES (2114, 'Sprinter Marino', 6);
INSERT INTO public.model VALUES (2115, 'Sprinter Trueno', 6);
INSERT INTO public.model VALUES (2116, 'Starlet', 6);
INSERT INTO public.model VALUES (2117, 'Succeed', 6);
INSERT INTO public.model VALUES (2118, 'Supra', 6);
INSERT INTO public.model VALUES (2119, 'Tacoma', 6);
INSERT INTO public.model VALUES (2120, 'Tank', 6);
INSERT INTO public.model VALUES (2121, 'Tercel', 6);
INSERT INTO public.model VALUES (2122, 'Touring HiAce', 6);
INSERT INTO public.model VALUES (2123, 'Town Ace', 6);
INSERT INTO public.model VALUES (2124, 'Tundra', 6);
INSERT INTO public.model VALUES (2125, 'Urban Cruiser', 6);
INSERT INTO public.model VALUES (2126, 'Vanguard', 6);
INSERT INTO public.model VALUES (2127, 'Vellfire', 6);
INSERT INTO public.model VALUES (2128, 'Veloz', 6);
INSERT INTO public.model VALUES (2129, 'Venza', 6);
INSERT INTO public.model VALUES (2130, 'Verossa', 6);
INSERT INTO public.model VALUES (2131, 'Verso', 6);
INSERT INTO public.model VALUES (2132, 'Verso-S', 6);
INSERT INTO public.model VALUES (2133, 'Vios', 6);
INSERT INTO public.model VALUES (2134, 'Vista', 6);
INSERT INTO public.model VALUES (2135, 'Vitz', 6);
INSERT INTO public.model VALUES (2136, 'Voltz', 6);
INSERT INTO public.model VALUES (2137, 'Voxy', 6);
INSERT INTO public.model VALUES (2138, 'Wigo', 6);
INSERT INTO public.model VALUES (2139, 'Wildlander', 6);
INSERT INTO public.model VALUES (2140, 'WiLL', 6);
INSERT INTO public.model VALUES (2141, 'WiLL Cypha', 6);
INSERT INTO public.model VALUES (2142, 'Windom', 6);
INSERT INTO public.model VALUES (2143, 'Wish', 6);
INSERT INTO public.model VALUES (2144, 'Yaris', 6);
INSERT INTO public.model VALUES (2145, 'Yaris Cross', 6);
INSERT INTO public.model VALUES (2146, 'Yaris Verso', 6);
INSERT INTO public.model VALUES (2147, 'Zelas', 6);
INSERT INTO public.model VALUES (2148, '181', 36);
INSERT INTO public.model VALUES (2149, 'Amarok', 36);
INSERT INTO public.model VALUES (2150, 'Arteon', 36);
INSERT INTO public.model VALUES (2151, 'Arteon R', 36);
INSERT INTO public.model VALUES (2152, 'Atlas', 36);
INSERT INTO public.model VALUES (2153, 'Atlas Cross Sport', 36);
INSERT INTO public.model VALUES (2154, 'Beetle', 36);
INSERT INTO public.model VALUES (2155, 'Bora', 36);
INSERT INTO public.model VALUES (2156, 'Caddy', 36);
INSERT INTO public.model VALUES (2157, 'California', 36);
INSERT INTO public.model VALUES (2158, 'Caravelle', 36);
INSERT INTO public.model VALUES (2159, 'Corrado', 36);
INSERT INTO public.model VALUES (2160, 'Derby', 36);
INSERT INTO public.model VALUES (2161, 'Eos', 36);
INSERT INTO public.model VALUES (2162, 'EuroVan', 36);
INSERT INTO public.model VALUES (2163, 'Fox', 36);
INSERT INTO public.model VALUES (2164, 'Gol', 36);
INSERT INTO public.model VALUES (2165, 'Golf', 36);
INSERT INTO public.model VALUES (2166, 'Golf Country', 36);
INSERT INTO public.model VALUES (2167, 'Golf GTI', 36);
INSERT INTO public.model VALUES (2168, 'Golf Plus', 36);
INSERT INTO public.model VALUES (2169, 'Golf R', 36);
INSERT INTO public.model VALUES (2170, 'Golf R32', 36);
INSERT INTO public.model VALUES (2171, 'Golf Sportsvan', 36);
INSERT INTO public.model VALUES (2172, 'ID.3', 36);
INSERT INTO public.model VALUES (2173, 'ID.4', 36);
INSERT INTO public.model VALUES (2174, 'ID.5', 36);
INSERT INTO public.model VALUES (2175, 'ID.6', 36);
INSERT INTO public.model VALUES (2176, 'ID.7', 36);
INSERT INTO public.model VALUES (2177, 'ID.Buzz', 36);
INSERT INTO public.model VALUES (2178, 'Iltis', 36);
INSERT INTO public.model VALUES (2179, 'Jetta', 36);
INSERT INTO public.model VALUES (2180, 'K70', 36);
INSERT INTO public.model VALUES (2181, 'Karmann-Ghia', 36);
INSERT INTO public.model VALUES (2182, 'Lamando', 36);
INSERT INTO public.model VALUES (2183, 'Lavida', 36);
INSERT INTO public.model VALUES (2184, 'Lupo', 36);
INSERT INTO public.model VALUES (2185, 'Lupo GTI', 36);
INSERT INTO public.model VALUES (2186, 'Magotan', 36);
INSERT INTO public.model VALUES (2187, 'Multivan', 36);
INSERT INTO public.model VALUES (2188, 'Parati', 36);
INSERT INTO public.model VALUES (2189, 'Passat', 36);
INSERT INTO public.model VALUES (2190, 'Passat CC', 36);
INSERT INTO public.model VALUES (2191, 'Phaeton', 36);
INSERT INTO public.model VALUES (2192, 'Phideon', 36);
INSERT INTO public.model VALUES (2193, 'Pointer', 36);
INSERT INTO public.model VALUES (2194, 'Polo', 36);
INSERT INTO public.model VALUES (2195, 'Polo GTI', 36);
INSERT INTO public.model VALUES (2196, 'Polo R WRC', 36);
INSERT INTO public.model VALUES (2197, 'Quantum', 36);
INSERT INTO public.model VALUES (2198, 'Routan', 36);
INSERT INTO public.model VALUES (2199, 'Sagitar', 36);
INSERT INTO public.model VALUES (2200, 'Santana', 36);
INSERT INTO public.model VALUES (2201, 'Scirocco', 36);
INSERT INTO public.model VALUES (2202, 'Scirocco R', 36);
INSERT INTO public.model VALUES (2203, 'Sharan', 36);
INSERT INTO public.model VALUES (2204, 'SpaceFox', 36);
INSERT INTO public.model VALUES (2205, 'T-Cross', 36);
INSERT INTO public.model VALUES (2206, 'T-Roc', 36);
INSERT INTO public.model VALUES (2207, 'T-Roc R', 36);
INSERT INTO public.model VALUES (2208, 'Tacqua', 36);
INSERT INTO public.model VALUES (2209, 'Taigo', 36);
INSERT INTO public.model VALUES (2210, 'Talagon', 36);
INSERT INTO public.model VALUES (2211, 'Taos', 36);
INSERT INTO public.model VALUES (2212, 'Taro', 36);
INSERT INTO public.model VALUES (2213, 'Tavendor', 36);
INSERT INTO public.model VALUES (2214, 'Tayron', 36);
INSERT INTO public.model VALUES (2215, 'Teramont', 36);
INSERT INTO public.model VALUES (2216, 'Tharu', 36);
INSERT INTO public.model VALUES (2217, 'Tiguan', 36);
INSERT INTO public.model VALUES (2218, 'Tiguan R', 36);
INSERT INTO public.model VALUES (2219, 'Touareg', 36);
INSERT INTO public.model VALUES (2220, 'Touran', 36);
INSERT INTO public.model VALUES (2221, 'Transporter', 36);
INSERT INTO public.model VALUES (2222, 'Type 1', 36);
INSERT INTO public.model VALUES (2223, 'Type 166', 36);
INSERT INTO public.model VALUES (2224, 'Type 2', 36);
INSERT INTO public.model VALUES (2225, 'Type 3', 36);
INSERT INTO public.model VALUES (2226, 'Type 4', 36);
INSERT INTO public.model VALUES (2227, 'Type 82', 36);
INSERT INTO public.model VALUES (2228, 'up!', 36);
INSERT INTO public.model VALUES (2229, 'Vento', 36);
INSERT INTO public.model VALUES (2230, 'Viloran', 36);
INSERT INTO public.model VALUES (2231, 'XL1', 36);
INSERT INTO public.model VALUES (2232, '120 Series', 30);
INSERT INTO public.model VALUES (2233, '140 Series', 30);
INSERT INTO public.model VALUES (2234, '164', 30);
INSERT INTO public.model VALUES (2235, '240 Series', 30);
INSERT INTO public.model VALUES (2236, '260 Series', 30);
INSERT INTO public.model VALUES (2237, '300 Series', 30);
INSERT INTO public.model VALUES (2238, '440', 30);
INSERT INTO public.model VALUES (2239, '460', 30);
INSERT INTO public.model VALUES (2240, '480', 30);
INSERT INTO public.model VALUES (2241, '66', 30);
INSERT INTO public.model VALUES (2242, '740', 30);
INSERT INTO public.model VALUES (2243, '760', 30);
INSERT INTO public.model VALUES (2244, '780', 30);
INSERT INTO public.model VALUES (2245, '850', 30);
INSERT INTO public.model VALUES (2246, '940', 30);
INSERT INTO public.model VALUES (2247, '960', 30);
INSERT INTO public.model VALUES (2248, 'C30', 30);
INSERT INTO public.model VALUES (2249, 'C40', 30);
INSERT INTO public.model VALUES (2250, 'C70', 30);
INSERT INTO public.model VALUES (2251, 'EM90', 30);
INSERT INTO public.model VALUES (2252, 'EX30', 30);
INSERT INTO public.model VALUES (2253, 'EX90', 30);
INSERT INTO public.model VALUES (2254, 'Laplander', 30);
INSERT INTO public.model VALUES (2255, 'P1800', 30);
INSERT INTO public.model VALUES (2256, 'P1900', 30);
INSERT INTO public.model VALUES (2257, 'PV444', 30);
INSERT INTO public.model VALUES (2258, 'PV544', 30);
INSERT INTO public.model VALUES (2259, 'S40', 30);
INSERT INTO public.model VALUES (2260, 'S60', 30);
INSERT INTO public.model VALUES (2261, 'S60 Cross Country', 30);
INSERT INTO public.model VALUES (2262, 'S70', 30);
INSERT INTO public.model VALUES (2263, 'S80', 30);
INSERT INTO public.model VALUES (2264, 'S90', 30);
INSERT INTO public.model VALUES (2265, 'V40', 30);
INSERT INTO public.model VALUES (2266, 'V40 Cross Country', 30);
INSERT INTO public.model VALUES (2267, 'V50', 30);
INSERT INTO public.model VALUES (2268, 'V60', 30);
INSERT INTO public.model VALUES (2269, 'V60 Cross Country', 30);
INSERT INTO public.model VALUES (2270, 'V70', 30);
INSERT INTO public.model VALUES (2271, 'V90', 30);
INSERT INTO public.model VALUES (2272, 'V90 Cross Country', 30);
INSERT INTO public.model VALUES (2273, 'XC40', 30);
INSERT INTO public.model VALUES (2274, 'XC60', 30);
INSERT INTO public.model VALUES (2275, 'XC70', 30);
INSERT INTO public.model VALUES (2276, 'XC90', 30);
INSERT INTO public.model VALUES (2277, '001', 68);
INSERT INTO public.model VALUES (2278, '007', 68);
INSERT INTO public.model VALUES (2279, '009', 68);
INSERT INTO public.model VALUES (2280, 'X', 68);
INSERT INTO public.model VALUES (2281, '12 ЗИМ', 37);
INSERT INTO public.model VALUES (2282, '13 «Чайка»', 37);
INSERT INTO public.model VALUES (2283, '14 «Чайка»', 37);
INSERT INTO public.model VALUES (2284, '18', 37);
INSERT INTO public.model VALUES (2285, '21 «Волга»', 37);
INSERT INTO public.model VALUES (2286, '22 «Волга»', 37);
INSERT INTO public.model VALUES (2287, '2308 «Атаман»', 37);
INSERT INTO public.model VALUES (2288, '2330 «Тигр»', 37);
INSERT INTO public.model VALUES (2289, '24 «Волга»', 37);
INSERT INTO public.model VALUES (2290, '25', 37);
INSERT INTO public.model VALUES (2291, '3102 «Волга»', 37);
INSERT INTO public.model VALUES (2292, '31022 «Волга»', 37);
INSERT INTO public.model VALUES (2293, '310221 «Волга»', 37);
INSERT INTO public.model VALUES (2294, '31029 «Волга»', 37);
INSERT INTO public.model VALUES (2295, '3103 «Волга»', 37);
INSERT INTO public.model VALUES (2296, '3105 «Волга»', 37);
INSERT INTO public.model VALUES (2297, '3110 «Волга»', 37);
INSERT INTO public.model VALUES (2298, '31105 «Волга»', 37);
INSERT INTO public.model VALUES (2299, '3111 «Волга»', 37);
INSERT INTO public.model VALUES (2300, '46', 37);
INSERT INTO public.model VALUES (2301, '61', 37);
INSERT INTO public.model VALUES (2302, '64', 37);
INSERT INTO public.model VALUES (2303, '69', 37);
INSERT INTO public.model VALUES (2304, 'Volga Siber', 37);
INSERT INTO public.model VALUES (2305, 'А', 37);
INSERT INTO public.model VALUES (2306, 'ГАЗ 67', 37);
INSERT INTO public.model VALUES (2307, 'М-20 «Победа»', 37);
INSERT INTO public.model VALUES (2308, 'М-72', 37);
INSERT INTO public.model VALUES (2309, 'М1', 37);
INSERT INTO public.model VALUES (2310, '1102 «Таврия»', 63);
INSERT INTO public.model VALUES (2311, '1103 «Славута»', 63);
INSERT INTO public.model VALUES (2312, '1105 «Дана»', 63);
INSERT INTO public.model VALUES (2313, '965', 63);
INSERT INTO public.model VALUES (2314, '966', 63);
INSERT INTO public.model VALUES (2315, '968', 63);
INSERT INTO public.model VALUES (2316, 'Chance', 63);
INSERT INTO public.model VALUES (2317, 'Forza', 63);
INSERT INTO public.model VALUES (2318, 'Lanos', 63);
INSERT INTO public.model VALUES (2319, 'Sens', 63);
INSERT INTO public.model VALUES (2320, 'Vida', 63);
INSERT INTO public.model VALUES (2321, '2125 «Комби»', 62);
INSERT INTO public.model VALUES (2322, '2126 «Ода»', 62);
INSERT INTO public.model VALUES (2323, '21261 «Фабула»', 62);
INSERT INTO public.model VALUES (2324, '2715', 62);
INSERT INTO public.model VALUES (2325, '2717', 62);
INSERT INTO public.model VALUES (2326, '27175', 62);
INSERT INTO public.model VALUES (2327, '1302 Волынь', 61);
INSERT INTO public.model VALUES (2328, '967', 61);
INSERT INTO public.model VALUES (2329, '969', 61);
INSERT INTO public.model VALUES (2330, '2136', 60);
INSERT INTO public.model VALUES (2331, '2137', 60);
INSERT INTO public.model VALUES (2332, '2138', 60);
INSERT INTO public.model VALUES (2333, '2140', 60);
INSERT INTO public.model VALUES (2334, '2141', 60);
INSERT INTO public.model VALUES (2335, '2142', 60);
INSERT INTO public.model VALUES (2336, '3', 60);
INSERT INTO public.model VALUES (2337, '3е', 60);
INSERT INTO public.model VALUES (2338, '400', 60);
INSERT INTO public.model VALUES (2339, '401', 60);
INSERT INTO public.model VALUES (2340, '402', 60);
INSERT INTO public.model VALUES (2341, '403', 60);
INSERT INTO public.model VALUES (2342, '407', 60);
INSERT INTO public.model VALUES (2343, '408', 60);
INSERT INTO public.model VALUES (2344, '410', 60);
INSERT INTO public.model VALUES (2345, '411', 60);
INSERT INTO public.model VALUES (2346, '412', 60);
INSERT INTO public.model VALUES (2347, '423', 60);
INSERT INTO public.model VALUES (2348, '424', 60);
INSERT INTO public.model VALUES (2349, '426', 60);
INSERT INTO public.model VALUES (2350, '427', 60);
INSERT INTO public.model VALUES (2351, '430', 60);
INSERT INTO public.model VALUES (2352, '434П', 60);
INSERT INTO public.model VALUES (2353, '5', 60);
INSERT INTO public.model VALUES (2354, '6', 60);
INSERT INTO public.model VALUES (2355, 'Дуэт', 60);
INSERT INTO public.model VALUES (2356, 'Иван Калита', 60);
INSERT INTO public.model VALUES (2357, 'Князь Владимир', 60);
INSERT INTO public.model VALUES (2358, 'Святогор', 60);
INSERT INTO public.model VALUES (2359, 'Юрий Долгорукий', 60);
INSERT INTO public.model VALUES (2360, '3151', 38);
INSERT INTO public.model VALUES (2361, '3153', 38);
INSERT INTO public.model VALUES (2362, '3159', 38);
INSERT INTO public.model VALUES (2363, '3160', 38);
INSERT INTO public.model VALUES (2364, '3162 Simbir', 38);
INSERT INTO public.model VALUES (2365, '469', 38);
INSERT INTO public.model VALUES (2366, 'Hunter', 38);
INSERT INTO public.model VALUES (2367, 'Patriot', 38);
INSERT INTO public.model VALUES (2368, 'Pickup', 38);
INSERT INTO public.model VALUES (2369, 'Астеро', 38);


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 217
-- Name: accessory_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accessory_cart_id_seq', 16, true);


--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 215
-- Name: accessory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accessory_id_seq', 9, true);


--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 221
-- Name: agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agent_id_seq', 1, true);


--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 229
-- Name: brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_id_seq', 9, true);


--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 223
-- Name: car_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.car_id_seq', 18, true);


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 225
-- Name: configuration_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.configuration_option_id_seq', 15, true);


--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 219
-- Name: deal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deal_id_seq', 11, true);


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 227
-- Name: model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.model_id_seq', 2369, true);


--
-- TOC entry 4712 (class 2606 OID 29088)
-- Name: __MigrationHistory PK_public.__MigrationHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__MigrationHistory"
    ADD CONSTRAINT "PK_public.__MigrationHistory" PRIMARY KEY ("MigrationId", "ContextKey");


--
-- TOC entry 4708 (class 2606 OID 29033)
-- Name: _cars_options PK_public._cars_options; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._cars_options
    ADD CONSTRAINT "PK_public._cars_options" PRIMARY KEY ("optionId", "carId");


--
-- TOC entry 4686 (class 2606 OID 28967)
-- Name: accessory PK_public.accessory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accessory
    ADD CONSTRAINT "PK_public.accessory" PRIMARY KEY (id);


--
-- TOC entry 4688 (class 2606 OID 28974)
-- Name: accessory_cart PK_public.accessory_cart; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accessory_cart
    ADD CONSTRAINT "PK_public.accessory_cart" PRIMARY KEY (id);


--
-- TOC entry 4696 (class 2606 OID 28992)
-- Name: agent PK_public.agent; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent
    ADD CONSTRAINT "PK_public.agent" PRIMARY KEY (id);


--
-- TOC entry 4706 (class 2606 OID 29028)
-- Name: brand PK_public.brand; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT "PK_public.brand" PRIMARY KEY (id);


--
-- TOC entry 4698 (class 2606 OID 29001)
-- Name: car PK_public.car; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT "PK_public.car" PRIMARY KEY (id);


--
-- TOC entry 4701 (class 2606 OID 29010)
-- Name: configuration_option PK_public.configuration_option; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration_option
    ADD CONSTRAINT "PK_public.configuration_option" PRIMARY KEY (id);


--
-- TOC entry 4692 (class 2606 OID 28983)
-- Name: deal PK_public.deal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal
    ADD CONSTRAINT "PK_public.deal" PRIMARY KEY (id);


--
-- TOC entry 4703 (class 2606 OID 29019)
-- Name: model PK_public.model; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT "PK_public.model" PRIMARY KEY (id);


--
-- TOC entry 4709 (class 1259 OID 29041)
-- Name: _cars_options_IX_carId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_cars_options_IX_carId" ON public._cars_options USING btree ("carId");


--
-- TOC entry 4710 (class 1259 OID 29040)
-- Name: _cars_options_IX_optionId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_cars_options_IX_optionId" ON public._cars_options USING btree ("optionId");


--
-- TOC entry 4689 (class 1259 OID 29035)
-- Name: accessory_cart_IX_accessoryId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "accessory_cart_IX_accessoryId" ON public.accessory_cart USING btree ("accessoryId");


--
-- TOC entry 4690 (class 1259 OID 29034)
-- Name: accessory_cart_IX_dealId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "accessory_cart_IX_dealId" ON public.accessory_cart USING btree ("dealId");


--
-- TOC entry 4699 (class 1259 OID 29038)
-- Name: car_IX_modelId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "car_IX_modelId" ON public.car USING btree ("modelId");


--
-- TOC entry 4693 (class 1259 OID 29037)
-- Name: deal_IX_agentId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "deal_IX_agentId" ON public.deal USING btree ("agentId");


--
-- TOC entry 4694 (class 1259 OID 29036)
-- Name: deal_IX_carId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "deal_IX_carId" ON public.deal USING btree ("carId");


--
-- TOC entry 4704 (class 1259 OID 29039)
-- Name: model_IX_brandId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "model_IX_brandId" ON public.model USING btree ("brandId");


--
-- TOC entry 4719 (class 2606 OID 29077)
-- Name: _cars_options FK_public._cars_options_public.car_carId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._cars_options
    ADD CONSTRAINT "FK_public._cars_options_public.car_carId" FOREIGN KEY ("carId") REFERENCES public.car(id) ON DELETE CASCADE;


--
-- TOC entry 4720 (class 2606 OID 29072)
-- Name: _cars_options FK_public._cars_options_public.configuration_option_optionId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._cars_options
    ADD CONSTRAINT "FK_public._cars_options_public.configuration_option_optionId" FOREIGN KEY ("optionId") REFERENCES public.configuration_option(id) ON DELETE CASCADE;


--
-- TOC entry 4713 (class 2606 OID 29047)
-- Name: accessory_cart FK_public.accessory_cart_public.accessory_accessoryId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accessory_cart
    ADD CONSTRAINT "FK_public.accessory_cart_public.accessory_accessoryId" FOREIGN KEY ("accessoryId") REFERENCES public.accessory(id);


--
-- TOC entry 4714 (class 2606 OID 29042)
-- Name: accessory_cart FK_public.accessory_cart_public.deal_dealId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accessory_cart
    ADD CONSTRAINT "FK_public.accessory_cart_public.deal_dealId" FOREIGN KEY ("dealId") REFERENCES public.deal(id) ON DELETE CASCADE;


--
-- TOC entry 4717 (class 2606 OID 29062)
-- Name: car FK_public.car_public.model_modelId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT "FK_public.car_public.model_modelId" FOREIGN KEY ("modelId") REFERENCES public.model(id);


--
-- TOC entry 4715 (class 2606 OID 29052)
-- Name: deal FK_public.deal_public.agent_agentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal
    ADD CONSTRAINT "FK_public.deal_public.agent_agentId" FOREIGN KEY ("agentId") REFERENCES public.agent(id);


--
-- TOC entry 4716 (class 2606 OID 29057)
-- Name: deal FK_public.deal_public.car_carId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal
    ADD CONSTRAINT "FK_public.deal_public.car_carId" FOREIGN KEY ("carId") REFERENCES public.car(id);


--
-- TOC entry 4718 (class 2606 OID 29067)
-- Name: model FK_public.model_public.brand_brandId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT "FK_public.model_public.brand_brandId" FOREIGN KEY ("brandId") REFERENCES public.brand(id);


-- Completed on 2023-12-26 22:55:02

--
-- PostgreSQL database dump complete
--

