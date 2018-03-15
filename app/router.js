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
};
