.class Lcom/android/server/usb/UsbSettingsManager;
.super Ljava/lang/Object;
.source "UsbSettingsManager.java"


# static fields
.field private static final DEBUG:Z

.field private static final LOG_TAG:Ljava/lang/String;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mSettingsByProfileGroup:Landroid/util/SparseArray;
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "mSettingsByProfileGroup"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/android/server/usb/UsbProfileGroupSettingsManager;",
            ">;"
        }
    .end annotation
.end field

.field private final mSettingsByUser:Landroid/util/SparseArray;
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "mSettingsByUser"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/android/server/usb/UsbUserSettingsManager;",
            ">;"
        }
    .end annotation
.end field

.field private mUserManager:Landroid/os/UserManager;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 39
    const-class v0, Lcom/android/server/usb/UsbSettingsManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/usb/UsbSettingsManager;->LOG_TAG:Ljava/lang/String;

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    .line 55
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 54
    iput-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByProfileGroup:Landroid/util/SparseArray;

    .line 59
    iput-object p1, p0, Lcom/android/server/usb/UsbSettingsManager;->mContext:Landroid/content/Context;

    .line 60
    const-string/jumbo v0, "user"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    iput-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mUserManager:Landroid/os/UserManager;

    .line 61
    return-void
.end method


# virtual methods
.method dump(Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 10

    .prologue
    const/4 v1, 0x0

    .line 141
    iget-object v3, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    monitor-enter v3

    .line 142
    :try_start_4
    iget-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v4

    move v2, v1

    .line 143
    :goto_b
    if-ge v2, v4, :cond_4e

    .line 144
    iget-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v5

    .line 145
    iget-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbUserSettingsManager;

    .line 146
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Settings for user "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 147
    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()V
    :try_end_3c
    .catchall {:try_start_4 .. :try_end_3c} :catchall_4b

    .line 149
    :try_start_3c
    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbUserSettingsManager;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V
    :try_end_3f
    .catchall {:try_start_3c .. :try_end_3f} :catchall_46

    .line 151
    :try_start_3f
    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()V

    .line 143
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_b

    .line 150
    :catchall_46
    move-exception v0

    .line 151
    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()V

    .line 150
    throw v0
    :try_end_4b
    .catchall {:try_start_3f .. :try_end_4b} :catchall_4b

    .line 141
    :catchall_4b
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_4e
    monitor-exit v3

    .line 156
    iget-object v2, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByProfileGroup:Landroid/util/SparseArray;

    monitor-enter v2

    .line 157
    :try_start_52
    iget-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByProfileGroup:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v3

    .line 158
    :goto_58
    if-ge v1, v3, :cond_9b

    .line 159
    iget-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByProfileGroup:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v4

    .line 160
    iget-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByProfileGroup:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    .line 161
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Settings for profile group "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 162
    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()V
    :try_end_89
    .catchall {:try_start_52 .. :try_end_89} :catchall_98

    .line 164
    :try_start_89
    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V
    :try_end_8c
    .catchall {:try_start_89 .. :try_end_8c} :catchall_93

    .line 166
    :try_start_8c
    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()V

    .line 158
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_58

    .line 165
    :catchall_93
    move-exception v0

    .line 166
    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()V

    .line 165
    throw v0
    :try_end_98
    .catchall {:try_start_8c .. :try_end_98} :catchall_98

    .line 156
    :catchall_98
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_9b
    monitor-exit v2

    .line 170
    return-void
.end method

.method getSettingsForProfileGroup(Landroid/os/UserHandle;)Lcom/android/server/usb/UsbProfileGroupSettingsManager;
    .registers 6

    .prologue
    .line 91
    iget-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {p1}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->getProfileParent(I)Landroid/content/pm/UserInfo;

    move-result-object v0

    .line 92
    if-eqz v0, :cond_10

    .line 93
    invoke-virtual {v0}, Landroid/content/pm/UserInfo;->getUserHandle()Landroid/os/UserHandle;

    move-result-object p1

    .line 98
    :cond_10
    iget-object v1, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByProfileGroup:Landroid/util/SparseArray;

    monitor-enter v1

    .line 99
    :try_start_13
    iget-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByProfileGroup:Landroid/util/SparseArray;

    .line 100
    invoke-virtual {p1}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v2

    .line 99
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    .line 101
    if-nez v0, :cond_31

    .line 102
    new-instance v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    iget-object v2, p0, Lcom/android/server/usb/UsbSettingsManager;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2, p1, p0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;-><init>(Landroid/content/Context;Landroid/os/UserHandle;Lcom/android/server/usb/UsbSettingsManager;)V

    .line 103
    iget-object v2, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByProfileGroup:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v3

    invoke-virtual {v2, v3, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_31
    .catchall {:try_start_13 .. :try_end_31} :catchall_33

    :cond_31
    monitor-exit v1

    .line 105
    return-object v0

    .line 98
    :catchall_33
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method getSettingsForUser(I)Lcom/android/server/usb/UsbUserSettingsManager;
    .registers 6

    .prologue
    .line 71
    iget-object v1, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    monitor-enter v1

    .line 72
    :try_start_3
    iget-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbUserSettingsManager;

    .line 73
    if-nez v0, :cond_1e

    .line 74
    new-instance v0, Lcom/android/server/usb/UsbUserSettingsManager;

    iget-object v2, p0, Lcom/android/server/usb/UsbSettingsManager;->mContext:Landroid/content/Context;

    new-instance v3, Landroid/os/UserHandle;

    invoke-direct {v3, p1}, Landroid/os/UserHandle;-><init>(I)V

    invoke-direct {v0, v2, v3}, Lcom/android/server/usb/UsbUserSettingsManager;-><init>(Landroid/content/Context;Landroid/os/UserHandle;)V

    .line 75
    iget-object v2, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    invoke-virtual {v2, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_20

    :cond_1e
    monitor-exit v1

    .line 77
    return-object v0

    .line 71
    :catchall_20
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method remove(Landroid/os/UserHandle;)V
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 115
    iget-object v1, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    monitor-enter v1

    .line 116
    :try_start_4
    iget-object v2, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->remove(I)V
    :try_end_d
    .catchall {:try_start_4 .. :try_end_d} :catchall_28

    monitor-exit v1

    .line 119
    iget-object v2, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByProfileGroup:Landroid/util/SparseArray;

    monitor-enter v2

    .line 120
    :try_start_11
    iget-object v1, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByProfileGroup:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v1

    if-ltz v1, :cond_2b

    .line 123
    iget-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByProfileGroup:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V
    :try_end_26
    .catchall {:try_start_11 .. :try_end_26} :catchall_43

    :cond_26
    monitor-exit v2

    .line 133
    return-void

    .line 115
    :catchall_28
    move-exception v0

    monitor-exit v1

    throw v0

    .line 127
    :cond_2b
    :try_start_2b
    iget-object v1, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByProfileGroup:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v3

    move v1, v0

    .line 128
    :goto_32
    if-ge v1, v3, :cond_26

    .line 129
    iget-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByProfileGroup:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->removeAllDefaultsForUser(Landroid/os/UserHandle;)V
    :try_end_3f
    .catchall {:try_start_2b .. :try_end_3f} :catchall_43

    .line 128
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_32

    .line 119
    :catchall_43
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method usbAccessoryRemoved(Landroid/hardware/usb/UsbAccessory;)V
    .registers 5

    .prologue
    .line 201
    iget-object v2, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    monitor-enter v2

    .line 202
    const/4 v0, 0x0

    move v1, v0

    :goto_5
    :try_start_5
    iget-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-ge v1, v0, :cond_1c

    .line 204
    iget-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbUserSettingsManager;

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbUserSettingsManager;->removeAccessoryPermissions(Landroid/hardware/usb/UsbAccessory;)V
    :try_end_18
    .catchall {:try_start_5 .. :try_end_18} :catchall_38

    .line 202
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_5

    :cond_1c
    monitor-exit v2

    .line 208
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.hardware.usb.action.USB_ACCESSORY_DETACHED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 209
    const/high16 v1, 0x1000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 210
    const-string/jumbo v1, "accessory"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 211
    iget-object v1, p0, Lcom/android/server/usb/UsbSettingsManager;->mContext:Landroid/content/Context;

    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 212
    return-void

    .line 201
    :catchall_38
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method usbDeviceRemoved(Landroid/hardware/usb/UsbDevice;)V
    .registers 5

    .prologue
    .line 178
    iget-object v2, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    monitor-enter v2

    .line 179
    const/4 v0, 0x0

    move v1, v0

    :goto_5
    :try_start_5
    iget-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-ge v1, v0, :cond_1c

    .line 181
    iget-object v0, p0, Lcom/android/server/usb/UsbSettingsManager;->mSettingsByUser:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbUserSettingsManager;

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbUserSettingsManager;->removeDevicePermissions(Landroid/hardware/usb/UsbDevice;)V
    :try_end_18
    .catchall {:try_start_5 .. :try_end_18} :catchall_38

    .line 179
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_5

    :cond_1c
    monitor-exit v2

    .line 185
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.hardware.usb.action.USB_DEVICE_DETACHED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 186
    const/high16 v1, 0x1000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 187
    const-string/jumbo v1, "device"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 192
    iget-object v1, p0, Lcom/android/server/usb/UsbSettingsManager;->mContext:Landroid/content/Context;

    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 193
    return-void

    .line 178
    :catchall_38
    move-exception v0

    monitor-exit v2

    throw v0
.end method
