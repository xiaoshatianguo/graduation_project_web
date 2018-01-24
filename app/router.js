'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;

  /**
   * 前端路由跳转
   */
  /** 主要路由跳转 */
  router.get('/', controller.Router.index);
  router.get('/activity', controller.Router.activity);
  router.get('/certified_architect', controller.Router.certifiedArchitect);
  router.get('/personal_space', controller.Router.personalSpace);

  /** 其他路由跳转 */
  router.get('/activity_detail', controller.Router.activityDetail);
  router.get('/join_activity', controller.Router.joinActivity);
  router.get('/apply_activity', controller.Router.applyActivity);
  router.get('/activity_manage', controller.Router.activityManage);
  router.get('/apply_certified_architect', controller.Router.applyCertifiedArchitect);
  router.get('/sort', controller.Router.sort);
  router.get('/production_detail', controller.Router.productionDetail);
};
