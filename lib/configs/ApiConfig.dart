const BASE_URL = 'http://185.143.45.35:9001';

const AUTH_PATH = '/api';
const API_PATH = '';
const CUSTOMERS_PATH = API_PATH + '/customers';

const LOGIN_END_POINT = AUTH_PATH + '/token/';

const GET_USER_END_POINT = CUSTOMERS_PATH + '/managers/me';
const GET_BALANCE_END_POINT = CUSTOMERS_PATH + '/managers/balance';

const LIST_TOPUPS_END_POINT = API_PATH + '/alimentation/topup';
const CREATE_TOPUP_END_POINT = API_PATH + '/alimentation/topup/';

const LIST_PRODUCTS_END_POINT = API_PATH + '/orders/products/after';
