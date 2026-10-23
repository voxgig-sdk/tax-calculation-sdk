import { CalculateEntity } from './entity/CalculateEntity';
export type * from './TaxCalculationTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { TaxCalculationEntityBase } from './TaxCalculationEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
type DirectResult = {
    ok: false;
    err: any;
    status?: undefined;
    headers?: undefined;
    data?: undefined;
} | {
    ok: boolean;
    status: number;
    headers: any;
    data: any;
    err?: any;
};
declare class TaxCalculationSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<DirectResult>;
    _rawRequest(fetchargs?: any): Promise<DirectResult>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    Calculate(entopts?: Record<string, any>): CalculateEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): TaxCalculationSDK;
    tester(testopts?: any, sdkopts?: any): TaxCalculationSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof TaxCalculationSDK;
export { stdutil, config, BaseFeature, TaxCalculationEntityBase, TaxCalculationSDK, SDK, };
export type { DirectResult };
