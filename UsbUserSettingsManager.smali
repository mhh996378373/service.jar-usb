.class Lcom/android/server/usb/UsbUserSettingsManager;
.super Ljava/lang/Object;
.source "UsbUserSettingsManager.java"


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "UsbUserSettingsManager"


# instance fields
.field private final mAccessoryPermissionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/hardware/usb/UsbAccessory;",
            "Landroid/util/SparseBooleanArray;",
            ">;"
        }
    .end annotation
.end field

.field private final mDevicePermissionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/util/SparseBooleanArray;",
            ">;"
        }
    .end annotation
.end field

.field private final mDisablePermissionDialogs:Z

.field private final mLock:Ljava/lang/Object;

.field private final mPackageManager:Landroid/content/pm/PackageManager;

.field private final mUser:Landroid/os/UserHandle;

.field private final mUserContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/UserHandle;)V
    .registers 5

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 51
    iput-object v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mDevicePermissionMap:Ljava/util/HashMap;

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 54
    iput-object v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mAccessoryPermissionMap:Ljava/util/HashMap;

    .line 57
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mLock:Ljava/lang/Object;

    .line 63
    :try_start_18
    const-string/jumbo v0, "android"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, p2}, Landroid/content/Context;->createPackageContextAsUser(Ljava/lang/String;ILandroid/os/UserHandle;)Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mUserContext:Landroid/content/Context;
    :try_end_22
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_18 .. :try_end_22} :catch_3a

    .line 68
    iget-object v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mUserContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 70
    iput-object p2, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mUser:Landroid/os/UserHandle;

    .line 72
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 73
    const v1, 0x112003f

    .line 72
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mDisablePermissionDialogs:Z

    .line 74
    return-void

    .line 64
    :catch_3a
    move-exception v0

    .line 65
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Missing android package"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private requestPermissionDialog(Landroid/content/Intent;Ljava/lang/String;Landroid/app/PendingIntent;)V
    .registers 9

    .prologue
    .line 140
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    .line 144
    :try_start_4
    iget-object v1, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mPackageManager:Landroid/content/pm/PackageManager;

    const/4 v2, 0x0

    invoke-virtual {v1, p2, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 145
    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    if-eq v1, v0, :cond_56

    .line 146
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "package "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 147
    const-string/jumbo v3, " does not match caller\'s uid "

    .line 146
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_34
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_34} :catch_34

    .line 149
    :catch_34
    move-exception v0

    .line 150
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "package "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " not found"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 153
    :cond_56
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    .line 154
    const-string/jumbo v1, "com.android.systemui"

    .line 155
    const-string/jumbo v4, "com.android.systemui.usb.UsbPermissionActivity"

    .line 154
    invoke-virtual {p1, v1, v4}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 156
    const/high16 v1, 0x10000000

    invoke-virtual {p1, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 157
    const-string/jumbo v1, "android.intent.extra.INTENT"

    invoke-virtual {p1, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 158
    const-string/jumbo v1, "package"

    invoke-virtual {p1, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 159
    const-string/jumbo v1, "android.intent.extra.UID"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 161
    :try_start_7a
    iget-object v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mUserContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mUser:Landroid/os/UserHandle;

    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->startActivityAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V
    :try_end_81
    .catch Landroid/content/ActivityNotFoundException; {:try_start_7a .. :try_end_81} :catch_85
    .catchall {:try_start_7a .. :try_end_81} :catchall_93

    .line 165
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 167
    :goto_84
    return-void

    .line 162
    :catch_85
    move-exception v0

    .line 163
    :try_start_86
    const-string/jumbo v0, "UsbUserSettingsManager"

    const-string/jumbo v1, "unable to start UsbPermissionActivity"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8f
    .catchall {:try_start_86 .. :try_end_8f} :catchall_93

    .line 165
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto :goto_84

    .line 164
    :catchall_93
    move-exception v0

    .line 165
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 164
    throw v0
.end method


# virtual methods
.method public checkPermission(Landroid/hardware/usb/UsbAccessory;)V
    .registers 5

    .prologue
    .line 134
    invoke-virtual {p0, p1}, Lcom/android/server/usb/UsbUserSettingsManager;->hasPermission(Landroid/hardware/usb/UsbAccessory;)Z

    move-result v0

    if-nez v0, :cond_20

    .line 135
    new-instance v0, Ljava/lang/SecurityException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "User has not given permission to accessory "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 137
    :cond_20
    return-void
.end method

.method public checkPermission(Landroid/hardware/usb/UsbDevice;)V
    .registers 5

    .prologue
    .line 128
    invoke-virtual {p0, p1}, Lcom/android/server/usb/UsbUserSettingsManager;->hasPermission(Landroid/hardware/usb/UsbDevice;)Z

    move-result v0

    if-nez v0, :cond_20

    .line 129
    new-instance v0, Ljava/lang/SecurityException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "User has not given permission to device "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :cond_20
    return-void
.end method

.method public dump(Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 10

    .prologue
    const/4 v2, 0x0

    .line 232
    iget-object v3, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 233
    :try_start_4
    const-string/jumbo v0, "Device permissions:"

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 234
    iget-object v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mDevicePermissionMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_14
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_76

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 235
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "  "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v5, ": "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/android/internal/util/IndentingPrintWriter;->print(Ljava/lang/String;)V

    .line 236
    iget-object v1, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mDevicePermissionMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseBooleanArray;

    .line 237
    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v5

    move v1, v2

    .line 238
    :goto_4b
    if-ge v1, v5, :cond_6f

    .line 239
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Lcom/android/internal/util/IndentingPrintWriter;->print(Ljava/lang/String;)V

    .line 238
    add-int/lit8 v1, v1, 0x1

    goto :goto_4b

    .line 241
    :cond_6f
    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->println()V
    :try_end_72
    .catchall {:try_start_4 .. :try_end_72} :catchall_73

    goto :goto_14

    .line 232
    :catchall_73
    move-exception v0

    monitor-exit v3

    throw v0

    .line 243
    :cond_76
    :try_start_76
    const-string/jumbo v0, "Accessory permissions:"

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 244
    iget-object v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mAccessoryPermissionMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_86
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_e5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/usb/UsbAccessory;

    .line 245
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "  "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v5, ": "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/android/internal/util/IndentingPrintWriter;->print(Ljava/lang/String;)V

    .line 246
    iget-object v1, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mAccessoryPermissionMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseBooleanArray;

    .line 247
    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v5

    move v1, v2

    .line 248
    :goto_bd
    if-ge v1, v5, :cond_e1

    .line 249
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Lcom/android/internal/util/IndentingPrintWriter;->print(Ljava/lang/String;)V

    .line 248
    add-int/lit8 v1, v1, 0x1

    goto :goto_bd

    .line 251
    :cond_e1
    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->println()V
    :try_end_e4
    .catchall {:try_start_76 .. :try_end_e4} :catchall_73

    goto :goto_86

    :cond_e5
    monitor-exit v3

    .line 254
    return-void
.end method

.method public grantAccessoryPermission(Landroid/hardware/usb/UsbAccessory;I)V
    .registers 6

    .prologue
    .line 221
    iget-object v1, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 222
    :try_start_3
    iget-object v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mAccessoryPermissionMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseBooleanArray;

    .line 223
    if-nez v0, :cond_18

    .line 224
    new-instance v0, Landroid/util/SparseBooleanArray;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Landroid/util/SparseBooleanArray;-><init>(I)V

    .line 225
    iget-object v2, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mAccessoryPermissionMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    :cond_18
    const/4 v2, 0x1

    invoke-virtual {v0, p2, v2}, Landroid/util/SparseBooleanArray;->put(IZ)V
    :try_end_1c
    .catchall {:try_start_3 .. :try_end_1c} :catchall_1e

    monitor-exit v1

    .line 229
    return-void

    .line 221
    :catchall_1e
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public grantDevicePermission(Landroid/hardware/usb/UsbDevice;I)V
    .registers 7

    .prologue
    .line 209
    iget-object v1, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 210
    :try_start_3
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceName()Ljava/lang/String;

    move-result-object v2

    .line 211
    iget-object v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mDevicePermissionMap:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseBooleanArray;

    .line 212
    if-nez v0, :cond_1c

    .line 213
    new-instance v0, Landroid/util/SparseBooleanArray;

    const/4 v3, 0x1

    invoke-direct {v0, v3}, Landroid/util/SparseBooleanArray;-><init>(I)V

    .line 214
    iget-object v3, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mDevicePermissionMap:Ljava/util/HashMap;

    invoke-virtual {v3, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    :cond_1c
    const/4 v2, 0x1

    invoke-virtual {v0, p2, v2}, Landroid/util/SparseBooleanArray;->put(IZ)V
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_22

    monitor-exit v1

    .line 218
    return-void

    .line 209
    :catchall_22
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public hasPermission(Landroid/hardware/usb/UsbAccessory;)Z
    .registers 5

    .prologue
    .line 114
    iget-object v1, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 115
    :try_start_3
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v2

    .line 116
    const/16 v0, 0x3e8

    if-eq v2, v0, :cond_f

    iget-boolean v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mDisablePermissionDialogs:Z
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_25

    if-eqz v0, :cond_12

    .line 117
    :cond_f
    const/4 v0, 0x1

    monitor-exit v1

    return v0

    .line 119
    :cond_12
    :try_start_12
    iget-object v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mAccessoryPermissionMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseBooleanArray;
    :try_end_1a
    .catchall {:try_start_12 .. :try_end_1a} :catchall_25

    .line 120
    if-nez v0, :cond_1f

    .line 121
    const/4 v0, 0x0

    monitor-exit v1

    return v0

    .line 123
    :cond_1f
    :try_start_1f
    invoke-virtual {v0, v2}, Landroid/util/SparseBooleanArray;->get(I)Z
    :try_end_22
    .catchall {:try_start_1f .. :try_end_22} :catchall_25

    move-result v0

    monitor-exit v1

    return v0

    .line 114
    :catchall_25
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public hasPermission(Landroid/hardware/usb/UsbDevice;)Z
    .registers 6

    .prologue
    .line 100
    iget-object v1, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 101
    :try_start_3
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v2

    .line 102
    const/16 v0, 0x3e8

    if-eq v2, v0, :cond_f

    iget-boolean v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mDisablePermissionDialogs:Z
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_29

    if-eqz v0, :cond_12

    .line 103
    :cond_f
    const/4 v0, 0x1

    monitor-exit v1

    return v0

    .line 105
    :cond_12
    :try_start_12
    iget-object v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mDevicePermissionMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseBooleanArray;
    :try_end_1e
    .catchall {:try_start_12 .. :try_end_1e} :catchall_29

    .line 106
    if-nez v0, :cond_23

    .line 107
    const/4 v0, 0x0

    monitor-exit v1

    return v0

    .line 109
    :cond_23
    :try_start_23
    invoke-virtual {v0, v2}, Landroid/util/SparseBooleanArray;->get(I)Z
    :try_end_26
    .catchall {:try_start_23 .. :try_end_26} :catchall_29

    move-result v0

    monitor-exit v1

    return v0

    .line 100
    :catchall_29
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method removeAccessoryPermissions(Landroid/hardware/usb/UsbAccessory;)V
    .registers 4

    .prologue
    .line 93
    iget-object v1, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 94
    :try_start_3
    iget-object v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mAccessoryPermissionMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_a

    monitor-exit v1

    .line 96
    return-void

    .line 93
    :catchall_a
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method removeDevicePermissions(Landroid/hardware/usb/UsbDevice;)V
    .registers 5

    .prologue
    .line 82
    iget-object v1, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 83
    :try_start_3
    iget-object v0, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mDevicePermissionMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_e

    monitor-exit v1

    .line 85
    return-void

    .line 82
    :catchall_e
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public requestPermission(Landroid/hardware/usb/UsbAccessory;Ljava/lang/String;Landroid/app/PendingIntent;)V
    .registers 7

    .prologue
    .line 190
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 193
    invoke-virtual {p0, p1}, Lcom/android/server/usb/UsbUserSettingsManager;->hasPermission(Landroid/hardware/usb/UsbAccessory;)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 194
    const-string/jumbo v1, "accessory"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 195
    const-string/jumbo v1, "permission"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 197
    :try_start_18
    iget-object v1, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mUserContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-virtual {p3, v1, v2, v0}, Landroid/app/PendingIntent;->send(Landroid/content/Context;ILandroid/content/Intent;)V
    :try_end_1e
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_18 .. :try_end_1e} :catch_29

    .line 201
    :goto_1e
    return-void

    .line 204
    :cond_1f
    const-string/jumbo v1, "accessory"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 205
    invoke-direct {p0, v0, p2, p3}, Lcom/android/server/usb/UsbUserSettingsManager;->requestPermissionDialog(Landroid/content/Intent;Ljava/lang/String;Landroid/app/PendingIntent;)V

    .line 206
    return-void

    .line 198
    :catch_29
    move-exception v0

    goto :goto_1e
.end method

.method public requestPermission(Landroid/hardware/usb/UsbDevice;Ljava/lang/String;Landroid/app/PendingIntent;)V
    .registers 7

    .prologue
    .line 170
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 173
    invoke-virtual {p0, p1}, Lcom/android/server/usb/UsbUserSettingsManager;->hasPermission(Landroid/hardware/usb/UsbDevice;)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 174
    const-string/jumbo v1, "device"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 175
    const-string/jumbo v1, "permission"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 177
    :try_start_18
    iget-object v1, p0, Lcom/android/server/usb/UsbUserSettingsManager;->mUserContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-virtual {p3, v1, v2, v0}, Landroid/app/PendingIntent;->send(Landroid/content/Context;ILandroid/content/Intent;)V
    :try_end_1e
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_18 .. :try_end_1e} :catch_29

    .line 181
    :goto_1e
    return-void

    .line 185
    :cond_1f
    const-string/jumbo v1, "device"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 186
    invoke-direct {p0, v0, p2, p3}, Lcom/android/server/usb/UsbUserSettingsManager;->requestPermissionDialog(Landroid/content/Intent;Ljava/lang/String;Landroid/app/PendingIntent;)V

    .line 187
    return-void

    .line 178
    :catch_29
    move-exception v0

    goto :goto_1e
.end method
