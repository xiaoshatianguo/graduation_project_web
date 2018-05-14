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
  router.get('/my_space', controller.pcRouter.mySpace);
  router.get('/login', controller.pcRouter.login);
  router.get('/register', controller.pcRouter.register);

  /** 其他路由跳转 */
  router.get('/activity_detail', controller.pcRouter.activityDetail);
  router.get('/join_activity', controller.pcRouter.joinActivity);
  router.get('/apply_activity', controller.pcRouter.applyActivity);
  router.get('/activity_manage', controller.pcRouter.activityManage);
  router.get('/apply_certified_architect', controller.pcRouter.applyCertifiedArchitect);
  router.get('/sort', controller.pcRouter.sort);
  router.get('/production_detail', controller.pcRouter.productionDetail);
  router.get('/publish_production', controller.pcRouter.publishProduction);
  router.get('/activity_rule', controller.pcRouter.activityRule);

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
  router.resources('certified_architect', '/api/certified_architect', controller.api.certifiedArchitect);
  router.resources('production_type', '/api/production_type', controller.api.productionType);
  router.resources('comments', '/api/comments', controller.api.comments);

  // 七牛云
  router.get('/api/qiuniuyun', controller.api.qiuniuUpload.qiuniuUpload);
  router.post('/qiniu', controller.qiuniu.qiuniuUpload);
  router.post('/tencent', controller.tencent.tencentUpload);

  // 发送验证码
  router.post('send_code', '/api/send_email', controller.api.sendEmail.sendEmail);
  // 验证验证码
  router.post('vertify_code', '/api/vertify_code', controller.api.vertifyCode.vertifyCode);

  // 前端登录注册登出api
  router.post('login', '/api/register', controller.pcRouter.registerUser);
  router.post('register', '/api/login', controller.pcRouter.loginVerify);
  router.post('logout', '/api/logout', controller.pcRouter.logout);

  // 上传作品
  router.post('uploadProduction', '/operation/upload_production', controller.operation.uploadProduction);
  // 申请活动
  router.post('applyActivity', '/operation/apply_activity', controller.operation.applyActivity);
  // 申请成为认证师
  router.post('applyCertifiedArchitect', '/operation/apply_certified_architect', controller.operation.applyCertifiedArchitect);

  // 获取所有分类
  router.get('sort', '/operation/sort', controller.operation.sort);
  // 分类页面流加载
  router.get('flowLoad', '/operation/flow_load', controller.operation.flowLoad);

  // 评论处理
  router.post('comment', '/operation/comment', controller.operation.comment);
  // 查询子评论
  router.get('childComment', '/operation/child_comment', controller.operation.childComment);
  // 评论点赞处理
  router.post('commentLike', '/operation/comment_like', controller.operation.commentLike);
  // 评论删除处理
  router.post('commentDelete', '/operation/comment_delete', controller.operation.commentDelete);

  // 关注会员处理
  router.post('attention', '/operation/attention', controller.operation.attention);
  // 获取关注信息处理
  router.post('attention', '/operation/attentionGet', controller.operation.attentionGet);
  // 收藏作品
  router.post('collectionProduction', '/operation/collection_production', controller.operation.collectionProduction);
  // 获取收藏作品信息处理
  router.post('collectionGet', '/operation/collectionGet', controller.operation.collectionGet);

  // 获取个人信息
  router.get('getPersonalData', '/operation/get_personal_data', controller.operation.getPersonalData);
  // 修改个人资料
  router.post('updatePersonalData', '/operation/update_personal_data', controller.operation.updatePersonalData);
};
