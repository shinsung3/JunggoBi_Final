# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from .search import ProductInfoIndex
# from .file import download,get_buffer_ext
# from django.core.files import File
# from urllib.parse import urlparse
class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Product(models.Model):
    id = models.IntegerField(primary_key=True)
    category = models.CharField(max_length=10, blank=True, null=True)
    manufacturer = models.CharField(max_length=50, blank=True, null=True)
    model_name = models.CharField(max_length=100, blank=True, null=True)
    generation = models.CharField(max_length=10, blank=True, null=True)
    display = models.CharField(max_length=10, blank=True, null=True)
    release_date = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'product'


class ProductInfo(models.Model):
    id = models.IntegerField(primary_key=True)
    category = models.CharField(max_length=10, blank=True, null=True)
    manufacturer = models.CharField(max_length=50, blank=True, null=True)
    model_name = models.CharField(max_length=100, blank=True, null=True)
    generation = models.CharField(max_length=10, blank=True, null=True)
    display = models.CharField(max_length=10, blank=True, null=True)
    cellular = models.CharField(max_length=10, blank=True, null=True)
    storage = models.CharField(max_length=10, blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)
    region = models.CharField(max_length=100, blank=True, null=True)
    date = models.DateField(blank=True, null=True)
    link = models.CharField(max_length=1000, blank=True, null=True)
    img_src = models.CharField(max_length=1000, blank=True, null=True)
    is_sell = models.IntegerField(blank=True, null=True)
    title = models.CharField(max_length=5000, blank=True, null=True)
    contents = models.CharField(max_length=5000, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'product_info'

    # def save(self, *args, **kwargs):
    #     if self.img_src.find('naver') != -1:
    #         item_image_url = self.img_src
    #         if item_image_url:
    #             temp_file = download(item_image_url)
    #             file_name = '{urlparse}.{ext}'.format(
    #                 # url의 마지막 '/' 내용 중 확장자 제거
    #                 # ex) url = 'https://~~~~~~/bag-1623898_960_720.jpg'
    #                 #     -> 'bag-1623898_960_720.jpg'
    #                 #     -> 'bag-1623898_960_720'
    #                 urlparse=self.id,
    #                 ext=get_buffer_ext(temp_file)
    #             )
    #             self.img_src.save(file_name)
    #             super().save()
    #         else:
    #             super().save()
    #     else:
    #         super().save()

    def indexing(self):
        obj = ProductInfoIndex(
            meta={'id': self.id},
            category=self.category,
            manufacturer=self.manufacturer,
            model_name=self.model_name,
            generation=self.generation,
            display=self.display,
            cellular=self.cellular,
            storage=self.storage,
            price=self.price,
            region=self.region,
            date=self.date,
            link=self.link,
            img_src=self.img_src,
            is_sell=self.is_sell,
            title=self.title,
            contents=self.contents,
        )
        obj.save()
        return obj.to_dict(include_meta=True)


class Tablet(models.Model):
    product = models.ForeignKey(Product, models.DO_NOTHING, blank=True, null=True)
    key_name = models.CharField(max_length=200, blank=True, null=True)
    cellular = models.CharField(max_length=10, blank=True, null=True)
    storage = models.CharField(max_length=10, blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)
    query = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tablet'
