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
  router.get('/', controller.router.index);
  router.get('/activity', controller.router.activity);
  router.get('/certified_architect', controller.router.certifiedArchitect);
  router.get('/personal_space', controller.router.personalSpace);

  /** 其他路由跳转 */
  router.get('/activity_detail', controller.router.activityDetail);
  router.get('/join_activity', controller.router.joinActivity);
  router.get('/apply_activity', controller.router.applyActivity);
  router.get('/activity_manage', controller.router.activityManage);
  router.get('/apply_certified_architect', controller.router.applyCertifiedArchitect);
  router.get('/sort', controller.router.sort);
  router.get('/production_detail', controller.router.productionDetail);
};
