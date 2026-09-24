import { createWebHistory, createRouter } from "vue-router";
import HomePage from "@/Pages/Home/HomePage.vue";
import SportPage from "@/Pages/Sport/SportPage.vue";
import { useAuthStore } from "@/Stores/Auth.js";
//import AffiliatePage from "@/Pages/Profile/AffiliatePage.vue";
import CassinoListPage from "@/Pages/Cassino/CassinoListPage.vue";
import CassinoSearch from "@/Pages/Cassino/CassinoSearch.vue";
//import WalletPage from "@/Pages/Profile/WalletPage.vue";
//import DepositPage from "@/Pages/Profile/DepositPage.vue";
//import WithdrawPage from "@/Pages/Profile/WithdrawPage.vue";
//import TransactionPage from "@/Pages/Profile/TransactionPage.vue";
import ConditionsReference from "@/Pages/Terms/ConditionsReference.vue";
import ServiceTerms from "@/Pages/Terms/ServiceTerms.vue";
import PrivacyPolicy from "@/Pages/Terms/PrivacyPolicy.vue";
import BonusTerms from "@/Pages/Terms/BonusTerms.vue";
import WelcomeBonus from "@/Pages/Terms/WelcomeBonus.vue";
import SupportPage from "@/Pages/Home/SupportPage.vue";
import PromotionPage from "@/Pages/Home/PromotionPage.vue";
import SupportCenterPage from "@/Pages/Home/SupportCenterPage.vue";
import DataPage from "@/Pages/ApiData/DataPage.vue";
import StripeSuccess from "@/Pages/Gateway/StripeSuccess.vue";
import StripeCancel from "@/Pages/Gateway/StripeCancel.vue";
import FavoritePage from "@/Pages/Profile/FavoritePage.vue";
import RecordPage from "@/Pages/Profile/RecordPage.vue";
import BonusPage from "@/Pages/Home/BonusPage.vue";
//import VipPage from "@/Pages/Profile/VipPage.vue";
import RecentsPage from "@/Pages/Profile/RecentsPage.vue";
import AwardsPage from "@/Pages/Home/AwardsPage.vue";
//import EventsPage from "@/Pages/Profile/EventsPage.vue";
//import MissionPage from "@/Pages/Profile/MissionPage.vue";
import LandingPage from "@/Pages/Landing/LandingPage.vue";
import CasinoPlayPage from "@/Pages/Cassino/CasinoPlayPage.vue";
import ForgotPassword from "@/Pages/Auth/ForgotPassword.vue";
import ProfilePage from "@/Pages/Profile/ProfilePage.vue";
import LinkDeConvite from "@/Pages/Profile/LinkDeConvite.vue";
import Comissao from "@/Pages/Profile/Comissao.vue";
import FinancaDosSub from "@/Pages/Profile/FinancaDosSub.vue";
import ApostasSub from "@/Pages/Profile/ApostasSub.vue";
import PedidosSub from "@/Pages/Profile/PedidosSub.vue";
//import AffiliateP from "@/Pages/Profile/AffiliateP.vue";
import Desempenho from "@/Pages/Profile/Desempenho.vue";
import Addaccount from "@/Pages/Profile/AddAccount.vue";
import CreatePassWithdraw from "@/Pages/Profile/CreatePassWithdraw.vue";
import CenterPage from "@/Pages/Profile/CenterPage.vue";
import CenterPagePague from "@/Pages/Profile/CenterPagePague.vue";
//import AllCategories from "@/Pages/Cassino/AllCategories.vue";
import EditInfosUser from "@/Pages/Profile/EditInfosUser.vue";
import CenterMessage from "@/Pages/Profile/CenterMessage.vue";

export const routes = [
    {
        name: "home",
        path: "/home/game?gameCategoryId=0",
        component: HomePage,
    },
    {
        path: "/",
        redirect: "/home/game?gameCategoryId=0",
    },
    {
        path: "/home/game",
        redirect: "/home/game?gameCategoryId=0",
    },
    {
        path: "/home/game?gameCategoryId=0",
        component: HomePage, // Substitua pelo componente correspondente
        // Você pode definir children se precisar de sub-rotas ou parâmetros específicos
    },
    {
        name: "login",
        path: "/login",
        component: HomePage,
    },
    {
        name: "forgotPassword",
        path: "/forgot-password",
        component: ForgotPassword,
    },
    {
        name: "resetPassword",
        path: "/reset-password/:token",
        component: HomePage, // Use HomePage como o componente principal
    },
    {
        name: "stripeSuccess",
        path: "/stripe/success",
        component: StripeSuccess,
    },
    {
        name: "stripeCancel",
        path: "/stripe/cancel",
        component: StripeCancel,
    },
    {
        name: "support",
        path: "/support",
        component: SupportPage,
    },
    {
        name: "promotion",
        path: "/promotion",
        component: PromotionPage,
    },
    {
        name: "sportPage",
        path: "/sports",
        component: SportPage,
    },
    {
        name: "supportCenter",
        path: "/support-center",
        component: SupportCenterPage,
    },
    {
        name: "register",
        path: "/home/game/:code?",
        component: HomePage,
    },
    {
        path: "/sports",
        component: {
            template: `<router-view></router-view>`,
        },
        children: [
            {
                name: "sports",
                path: "", // Rota vazia para exibir a página de esportes
                component: SportPage,
            },
        ],
    },

    {
        name: "favoritePage",
        path: "/profile/favorite",
        component: FavoritePage,
        meta: {
            auth: true,
        },
    },
    {
        name: "casinos",
        path: "/casinos",
        component: HomePage,
    },
    {
        name: "casinoPlayPage",
        path: "/games/play/:id/:slug",
        component: CasinoPlayPage,
    },
    {
        name: "casinosAll",
        path: "/casino/provider/:provider?/category/:category?",
        component: CassinoListPage,
    },
    //{
    //    name: "categoriesAll",
    //    path: "/home/game/categoriesalls",
    //    component: AllCategories,
    //},
    {
        name: "casinoSearch",
        path: "/casino/search",
        component: CassinoSearch,
    },
    //{
    //    name: "profileWallet",
    //    path: "/profile/wallet",
    //    component: WalletPage,
    //    meta: {
    //        auth: true,
    //    },
    // },
    {
        name: "createpin",
        path: "/profile/createpin",
        component: CreatePassWithdraw,
        meta: {
            auth: true,
        },
    },
    {
        name: "profileLink",
        path: "/profile/linkconvite",
        component: LinkDeConvite,
        meta: {
            auth: true,
        },
    },
    {
        name: "addaccount",
        path: "/profile/addaccount",
        component: Addaccount,
        meta: {
            auth: true,
        },
    },
    {
        name: "profileDesempenho",
        path: "/profile/desempenho",
        component: Desempenho,
        meta: {
            auth: true,
        },
    },
    {
        name: "profilecomissao",
        path: "/profile/comissao",
        component: Comissao,
        meta: {
            auth: true,
        },
    },
    {
        name: "profilefinance",
        path: "/profile/finance",
        component: FinancaDosSub,
        meta: {
            auth: true,
        },
    },
    {
        name: "profileapostas",
        path: "/profile/apostas",
        component: ApostasSub,
        meta: {
            auth: true,
        },
    },
    {
        name: "profilepedidos",
        path: "/profile/pedidos",
        component: PedidosSub,
        meta: {
            auth: true,
        },
    },
    {
        name: "recentsPage",
        path: "/profile/recents",
        component: RecentsPage,
        meta: {
            auth: true,
        },
    },
    {
        name: "centermessage",
        path: "/profile/messages",
        component: CenterMessage,
        meta: {
            auth: true,
        },
    },

    {
        name: "centerpage",
        path: "/profile/promocoes",
        component: CenterPage,
        meta: {
            auth: true,
        },
    },
    {
        name: "gerenciarPague",
        path: "/profile/financas",
        component: CenterPagePague,
        meta: {
            auth: true,
        },
    },
    {
        name: "profileProfile",
        path: "/profile/profile",
        component: ProfilePage,
        meta: {
            auth: true,
        },
    },
    {
        name: "profileInfos",
        path: "/profile/settings",
        component: EditInfosUser,
        meta: {
            auth: true,
        },
    },

    {
        name: "termsConditionsReference",
        path: "/terms/conditions-reference",
        component: ConditionsReference,
    },
    {
        name: "serviceTerms",
        path: "/terms/service",
        component: ServiceTerms,
    },
    {
        name: "privacyPolicy",
        path: "/terms/privacy-policy",
        component: PrivacyPolicy,
    },
    {
        name: "bonusTerms",
        path: "/terms/bonus",
        component: BonusTerms,
    },
    {
        name: "welcomeBonus",
        path: "/terms/bonus-welcome",
        component: WelcomeBonus,
    },
    {
        name: "dataPage",
        path: "/datapage",
        component: DataPage,
    },
    {
        name: "recordPage",
        path: "/records",
        component: RecordPage,
    },

    {
        name: "bonusPage",
        path: "/bonus",
        component: BonusPage,
    },
    {
        name: "awardsPage",
        path: "/awards",
        component: AwardsPage,
    },
    {
        name: "landingPage",
        path: "/landing/spin",
        component: LandingPage,
    },
];

const router = createRouter({
    history: createWebHistory(import.meta.env.VITE_BASE_URL || "/"),
    routes: routes,
});

router.beforeEach(async (to, from, next) => {
    if (to.meta?.auth) {
        const auth = useAuthStore();
        auth.isAuth ? next() : next({ name: "home" });
    } else {
        next();
    }
});

export default router;
