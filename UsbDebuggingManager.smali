.class public Lcom/android/server/usb/UsbDebuggingManager;
.super Ljava/lang/Object;
.source "UsbDebuggingManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingHandler;,
        Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;
    }
.end annotation


# static fields
.field private static final ADBD_SOCKET:Ljava/lang/String; = "adbd"

.field private static final ADB_DIRECTORY:Ljava/lang/String; = "misc/adb"

.field private static final ADB_KEYS_FILE:Ljava/lang/String; = "adb_keys"

.field private static final BUFFER_SIZE:I = 0x1000

.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "UsbDebuggingManager"


# instance fields
.field private mAdbEnabled:Z

.field private final mContext:Landroid/content/Context;

.field private mFingerprints:Ljava/lang/String;

.field private final mHandler:Landroid/os/Handler;

.field private mThread:Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;


# direct methods
.method static synthetic -get0(Lcom/android/server/usb/UsbDebuggingManager;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/android/server/usb/UsbDebuggingManager;->mAdbEnabled:Z

    return v0
.end method

.method static synthetic -get1(Lcom/android/server/usb/UsbDebuggingManager;)Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager;->mFingerprints:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/server/usb/UsbDebuggingManager;)Landroid/os/Handler;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/server/usb/UsbDebuggingManager;)Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager;->mThread:Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/server/usb/UsbDebuggingManager;Z)Z
    .registers 2

    iput-boolean p1, p0, Lcom/android/server/usb/UsbDebuggingManager;->mAdbEnabled:Z

    return p1
.end method

.method static synthetic -set1(Lcom/android/server/usb/UsbDebuggingManager;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    iput-object p1, p0, Lcom/android/server/usb/UsbDebuggingManager;->mFingerprints:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic -set2(Lcom/android/server/usb/UsbDebuggingManager;Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;)Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;
    .registers 2

    iput-object p1, p0, Lcom/android/server/usb/UsbDebuggingManager;->mThread:Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;

    return-object p1
.end method

.method static synthetic -wrap0(Lcom/android/server/usb/UsbDebuggingManager;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbDebuggingManager;->getFingerprints(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic -wrap1(Lcom/android/server/usb/UsbDebuggingManager;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/usb/UsbDebuggingManager;->deleteKeyFile()V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/server/usb/UsbDebuggingManager;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/android/server/usb/UsbDebuggingManager;->startConfirmation(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/server/usb/UsbDebuggingManager;Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbDebuggingManager;->writeKey(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/usb/UsbDebuggingManager;->mAdbEnabled:Z

    .line 69
    new-instance v0, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingHandler;

    invoke-static {}, Lcom/android/server/FgThread;->get()Lcom/android/server/FgThread;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/server/FgThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingHandler;-><init>(Lcom/android/server/usb/UsbDebuggingManager;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager;->mHandler:Landroid/os/Handler;

    .line 70
    iput-object p1, p0, Lcom/android/server/usb/UsbDebuggingManager;->mContext:Landroid/content/Context;

    .line 71
    return-void
.end method

.method private createConfirmationIntent(Landroid/content/ComponentName;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .registers 7

    .prologue
    .line 383
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 384
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 385
    const-string/jumbo v1, "key"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 386
    const-string/jumbo v1, "fingerprints"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 387
    return-object v0
.end method

.method private deleteKeyFile()V
    .registers 2

    .prologue
    .line 428
    invoke-direct {p0}, Lcom/android/server/usb/UsbDebuggingManager;->getUserKeyFile()Ljava/io/File;

    move-result-object v0

    .line 429
    if-eqz v0, :cond_9

    .line 430
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 432
    :cond_9
    return-void
.end method

.method private getFingerprints(Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .prologue
    const/4 v0, 0x0

    .line 291
    const-string/jumbo v1, "0123456789ABCDEF"

    .line 292
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 295
    if-nez p1, :cond_f

    .line 296
    const-string/jumbo v0, ""

    return-object v0

    .line 300
    :cond_f
    :try_start_f
    const-string/jumbo v3, "MD5"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_15} :catch_55

    move-result-object v3

    .line 306
    const-string/jumbo v4, "\\s+"

    invoke-virtual {p1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    aget-object v4, v4, v0

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    .line 309
    const/4 v5, 0x0

    :try_start_24
    invoke-static {v4, v5}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/security/MessageDigest;->digest([B)[B
    :try_end_2b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_24 .. :try_end_2b} :catch_63

    move-result-object v3

    .line 314
    :goto_2c
    array-length v4, v3

    if-ge v0, v4, :cond_71

    .line 315
    aget-byte v4, v3, v0

    shr-int/lit8 v4, v4, 0x4

    and-int/lit8 v4, v4, 0xf

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 316
    aget-byte v4, v3, v0

    and-int/lit8 v4, v4, 0xf

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 317
    array-length v4, v3

    add-int/lit8 v4, v4, -0x1

    if-ge v0, v4, :cond_52

    .line 318
    const-string/jumbo v4, ":"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    :cond_52
    add-int/lit8 v0, v0, 0x1

    goto :goto_2c

    .line 301
    :catch_55
    move-exception v0

    .line 302
    const-string/jumbo v1, "UsbDebuggingManager"

    const-string/jumbo v2, "Error getting digester"

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 303
    const-string/jumbo v0, ""

    return-object v0

    .line 310
    :catch_63
    move-exception v0

    .line 311
    const-string/jumbo v1, "UsbDebuggingManager"

    const-string/jumbo v2, "error doing base64 decoding"

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 312
    const-string/jumbo v0, ""

    return-object v0

    .line 320
    :cond_71
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getUserKeyFile()Ljava/io/File;
    .registers 4

    .prologue
    .line 391
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v0

    .line 392
    new-instance v1, Ljava/io/File;

    const-string/jumbo v2, "misc/adb"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 394
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1d

    .line 395
    const-string/jumbo v0, "UsbDebuggingManager"

    const-string/jumbo v1, "ADB data directory does not exist"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    const/4 v0, 0x0

    return-object v0

    .line 399
    :cond_1d
    new-instance v0, Ljava/io/File;

    const-string/jumbo v2, "adb_keys"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private startConfirmation(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    .prologue
    .line 324
    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v0

    .line 325
    iget-object v1, p0, Lcom/android/server/usb/UsbDebuggingManager;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/os/UserManager;->get(Landroid/content/Context;)Landroid/os/UserManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v1

    .line 327
    invoke-virtual {v1}, Landroid/content/pm/UserInfo;->isAdmin()Z

    move-result v0

    if-eqz v0, :cond_38

    .line 328
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    .line 329
    const v2, 0x104010f

    .line 328
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 336
    :goto_1f
    invoke-static {v0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v2

    .line 337
    invoke-virtual {v1}, Landroid/content/pm/UserInfo;->getUserHandle()Landroid/os/UserHandle;

    move-result-object v3

    invoke-direct {p0, v2, v3, p1, p2}, Lcom/android/server/usb/UsbDebuggingManager;->startConfirmationActivity(Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_37

    .line 338
    invoke-virtual {v1}, Landroid/content/pm/UserInfo;->getUserHandle()Landroid/os/UserHandle;

    move-result-object v1

    invoke-direct {p0, v2, v1, p1, p2}, Lcom/android/server/usb/UsbDebuggingManager;->startConfirmationService(Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    .line 337
    if-eqz v1, :cond_44

    .line 340
    :cond_37
    return-void

    .line 333
    :cond_38
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    .line 334
    const v2, 0x1040110

    .line 333
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1f

    .line 342
    :cond_44
    const-string/jumbo v1, "UsbDebuggingManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "unable to start customAdbPublicKeyConfirmation[SecondaryUser]Component "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 343
    const-string/jumbo v2, " as an Activity or a Service"

    .line 342
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    return-void
.end method

.method private startConfirmationActivity(Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 9

    .prologue
    .line 351
    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 352
    invoke-direct {p0, p1, p3, p4}, Lcom/android/server/usb/UsbDebuggingManager;->createConfirmationIntent(Landroid/content/ComponentName;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 353
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 354
    const/high16 v2, 0x10000

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    if-eqz v0, :cond_39

    .line 356
    :try_start_17
    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1, p2}, Landroid/content/Context;->startActivityAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V
    :try_end_1c
    .catch Landroid/content/ActivityNotFoundException; {:try_start_17 .. :try_end_1c} :catch_1e

    .line 357
    const/4 v0, 0x1

    return v0

    .line 358
    :catch_1e
    move-exception v0

    .line 359
    const-string/jumbo v1, "UsbDebuggingManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "unable to start adb whitelist activity: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 362
    :cond_39
    const/4 v0, 0x0

    return v0
.end method

.method private startConfirmationService(Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 9

    .prologue
    .line 370
    invoke-direct {p0, p1, p3, p4}, Lcom/android/server/usb/UsbDebuggingManager;->createConfirmationIntent(Landroid/content/ComponentName;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 372
    :try_start_4
    iget-object v1, p0, Lcom/android/server/usb/UsbDebuggingManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0, p2}, Landroid/content/Context;->startServiceAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/ComponentName;
    :try_end_9
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_9} :catch_e

    move-result-object v0

    if-eqz v0, :cond_29

    .line 373
    const/4 v0, 0x1

    return v0

    .line 375
    :catch_e
    move-exception v0

    .line 376
    const-string/jumbo v1, "UsbDebuggingManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "unable to start adb whitelist service: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 378
    :cond_29
    const/4 v0, 0x0

    return v0
.end method

.method private writeKey(Ljava/lang/String;)V
    .registers 7

    .prologue
    .line 404
    :try_start_0
    invoke-direct {p0}, Lcom/android/server/usb/UsbDebuggingManager;->getUserKeyFile()Ljava/io/File;

    move-result-object v0

    .line 406
    if-nez v0, :cond_7

    .line 407
    return-void

    .line 410
    :cond_7
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1b

    .line 411
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    .line 412
    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    .line 413
    const/16 v2, 0x1a0

    .line 414
    const/4 v3, -0x1

    const/4 v4, -0x1

    .line 412
    invoke-static {v1, v2, v3, v4}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    .line 417
    :cond_1b
    new-instance v1, Ljava/io/FileOutputStream;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 418
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 419
    const/16 v0, 0xa

    invoke-virtual {v1, v0}, Ljava/io/FileOutputStream;->write(I)V

    .line 420
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_30} :catch_31

    .line 425
    :goto_30
    return-void

    .line 422
    :catch_31
    move-exception v0

    .line 423
    const-string/jumbo v1, "UsbDebuggingManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Error writing key:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_30
.end method


# virtual methods
.method public allowUsbDebugging(ZLjava/lang/String;)V
    .registers 5

    .prologue
    .line 440
    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 441
    if-eqz p1, :cond_14

    const/4 v0, 0x1

    :goto_a
    iput v0, v1, Landroid/os/Message;->arg1:I

    .line 442
    iput-object p2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 443
    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 444
    return-void

    .line 441
    :cond_14
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public clearUsbDebuggingKeys()V
    .registers 3

    .prologue
    .line 451
    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 452
    return-void
.end method

.method public denyUsbDebugging()V
    .registers 3

    .prologue
    .line 447
    iget-object v0, p0, Lcom/android/server/usb/UsbDebuggingManager;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 448
    return-void
.end method

.method public dump(Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 5

    .prologue
    const/4 v0, 0x0

    .line 455
    const-string/jumbo v1, "USB Debugging State:"

    invoke-virtual {p1, v1}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 456
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "  Connected to adbd: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/usb/UsbDebuggingManager;->mThread:Lcom/android/server/usb/UsbDebuggingManager$UsbDebuggingThread;

    if-eqz v2, :cond_18

    const/4 v0, 0x1

    :cond_18
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 457
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  Last key received: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usb/UsbDebuggingManager;->mFingerprints:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 458
    const-string/jumbo v0, "  User keys:"

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 460
    :try_start_42
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "/data/misc/adb/adb_keys"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/os/FileUtils;->readTextFile(Ljava/io/File;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_53
    .catch Ljava/io/IOException; {:try_start_42 .. :try_end_53} :catch_6b

    .line 464
    :goto_53
    const-string/jumbo v0, "  System keys:"

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 466
    :try_start_59
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "/adb_keys"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/os/FileUtils;->readTextFile(Ljava/io/File;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_6a
    .catch Ljava/io/IOException; {:try_start_59 .. :try_end_6a} :catch_84

    .line 470
    :goto_6a
    return-void

    .line 461
    :catch_6b
    move-exception v0

    .line 462
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "IOException: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    goto :goto_53

    .line 467
    :catch_84
    move-exception v0

    .line 468
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "IOException: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    goto :goto_6a
.end method

.method public setAdbEnabled(Z)V
    .registers 4

    .prologue
    .line 435
    iget-object v1, p0, Lcom/android/server/usb/UsbDebuggingManager;->mHandler:Landroid/os/Handler;

    if-eqz p1, :cond_9

    const/4 v0, 0x1

    :goto_5
    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 437
    return-void

    .line 436
    :cond_9
    const/4 v0, 0x2

    goto :goto_5
.end method
