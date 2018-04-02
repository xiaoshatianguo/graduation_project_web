'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;

  /**
   * 前端pc路由跳转
   */
  /** 主要路由跳转 */
  router.get('/', controller.pcRouter.index);
  router.get('/activity', controller.pcRouter.activity);
  router.get('/certified_architect', controller.pcRouter.certifiedArchitect);
  router.get('/personal_space', controller.pcRouter.personalSpace);

  /** 其他路由跳转 */
  router.get('/activity_detail', controller.pcRouter.activityDetail);
  router.get('/join_activity', controller.pcRouter.joinActivity);
  router.get('/apply_activity', controller.pcRouter.applyActivity);
  router.get('/activity_manage', controller.pcRouter.activityManage);
  router.get('/apply_certified_architect', controller.pcRouter.applyCertifiedArchitect);
  router.get('/sort', controller.pcRouter.sort);
  router.get('/production_detail', controller.pcRouter.productionDetail);

  /**
   * 管理后台api路由
   */
  // 后台管理员登录
  router.post('/api/login/account', controller.api.login.login);
  router.get('/api/currentUser', controller.api.login.currentUser);

  // 后台表格api
  router.resources('admin', '/api/admin', controller.api.admin);
  router.resources('activity', '/api/activity', controller.api.activity);
  router.resources('production', '/api/production', controller.api.production);
  router.resources('user', '/api/user', controller.api.user);
  router.resources('production_type', '/api/production_type', controller.api.productionType);
  router.resources('comments', '/api/comments', controller.api.comments);
  router.resources('attention', '/api/attention', controller.api.attention);
};
